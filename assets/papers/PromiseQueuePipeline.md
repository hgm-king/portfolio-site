# Asynchronous Method Chaining
### A short study on building a promise queue pipeline
##### HG King
##### April 2020

## What is Method Chaining?

Let's talk about method chaining. This is a pattern that is found all throughout coding and is one of my favorite things to do in Javascript. If you are familiar with this concept, feel free to skim this section.

Here is an example of code that makes me feel great inside:
``` javascript
numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

numPrimes = numbers
  .map(n => Math.pow(2, n) % n)
  .filter(n => n !== 2)
  .length
```
This is a very elegant way to find out how many primes are in a list of numbers. If we really wanted to be cool, we would change the pow method above to something a little more useful. Then we would find out if super huge numbers are prime. But that is for another day.

Here is an example of another way we could have written this:
``` javascript
numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
numPrimes = 0;

for ( let i = 0; i < numbers.length; i++ ) {
  calc = Math.pow(2, numbers[i]) % numbers[i];
  if ( calc === 2 )  {
    numPrimes++;
  }
}
```
The point of the example is to show how we would be able to use an awesome property of certain class methods. In this example, we are using an `Array` class which has all sorts of goodies in the object prototype. For those who do not know what the prototype is, let’s just say it is the definition of what a thing can do. Out of the box, our Array class will allow us to use `map`, `reduce`, `filter`, and many others. These methods do a lot of great things but my favorite part is that they return an `Array`. This means we can continue to call `Array` methods on whatever comes back. Let’s describe this a bit better through a simple example.
``` javascript
array = [1,2,3,4];

// the result is a brand new array
odds = array.filter(n => n % 2 === 1);  // output :: [1,3]

// filter keeps your original array intact
evens = array.filter(n => n % 2 === 0); // output :: [2,4]
moreEvens = evens.map(n => n * 2);      // output :: [4,8]

// if you think really hard, you may be able to see that evens is just a placeholder
// we know filter comes back with and we wont use it later, why not do this:
moreEvens = array.filter(n => n % 2 === 0).map(n => n * 2);
```
## How Do I Use This Pattern?

Based on what we reviewed above, this pattern will be easy as pi to recreate in your own classes. The magic sauce: resolve to `this`!

Now, don’t get me wrong, `this` is a keyword no human should take lightly in Javascript. Easily the most confusing thing out there (for me). But here we will take it easy and not do anything wild, yet. Let’s build a class that we can chain methods on.
``` javascript
class Chainer {
  foo(x)  {
    this.value = x
    return this;
  }

  bar()  {
    this.value += 42
    return this;
  }

  baz()  {
    this.value -= 13
    return this;
  }

  result()  {
    return this.value;
  }
}

chainer = new Chainer();
value = chainer.foo(15) // foo assigns
               .bar()   // bar adds
               .baz()   // baz subtracts
               .result()
// output :: 44
```
We won’t need to go over this too much. There are two ideas in work here.

First, the fact we return this at the end of our methods is key. The keyword refers to the most immediate containing scope. In our case, it is the `Chainer`. Returning it at the end of each of our methods mean they resolve to the `Chainer` object, which again has all our methods defined on it. Makes sense, right?

We are keeping data on our object. In the Object Oriented world, this is called an instance variable. What this allows us to do is keep a context of data inside our object. This way, we use our methods to run a series of transforms on our context. Our `Chainer` can be thought of as a pipeline, which is exactly our desired effect!

## Wait a Second, What about Async?

Oh man, you must be on top of your game if you’re thinking about asynchronous methods! Up until this point, we were taking it easy. But in order to really put this pattern to good use, we will have to apply some pressure. It is Javascript after all; there are going to be asynchronous calls whether we like it or not.

We all are familiar with async calls and promises. Here are two ways to work with them:
``` javascript
// this makes a new Promise and will resolve after 1 second
asyncWait = async () => new Promise(resolve => setTimeout(resolve, 1000 ));

// this is extra credit; google IIFE if youre curious
(async () => {
  // here we will make the process pause until the function resolves
  await asyncWait();
  console.log('1');

  // here we give a handler that runs when the function resolves
  // but the process moves along without waiting
  asyncWait().then((res) => {
    console.log('2');
  })
  console.log('3');
})();
// output :: 1 3 2
```
With these two forms of using async calls, how would we be able to chain? Before we dive into this, I need to mention a few things that will explain why we can’t use the regular chaining above. Whenever we use async when defining a function, it will always return something wrapper in a `Promise`. This means our methods that return this will actually return this in a `Promise`. In turn, that means we have to wait for it to resolve or else we can’t chain!

Lets give it a try:
``` javascript
class AsyncChainer {
  constructor()  {
    this.waits = 0;
  }

  wait = async (x) => {
    await asyncWait(); // defined in a past example
    console.log(this.waits++);
    return this;
  }
}

(async () => {
  const chainer = new AsyncChainer();

  // this actually works, how gross
  await (
    await (
      await (
        await (
          await chainer.wait()
        ).wait()
      ).wait()
    ).wait()
  ).wait();
  console.log('Finished awaits');

  // this also works
  await chainer.wait()
    .then(c => c.wait())
    .then(c => c.wait())
    .then(c => c.wait())
  console.log('Finished thens');
})();
// output :: 0 1 2 3 4 Finished awaits
//           5 6 7 8 Finished thens
```
Now these examples sure are awful. The first one is really painful to look at. I really did not like typing that out. But sure enough it works. We just make sure to nest each expression in parentheses so that we can await whatever the next nested expression resolves into. Looks a little bit like recursion, though. We do not fear recursion; nay, we are friends!

The second one looks a bit nicer. Still not as crisp as the pure chained methods though. We can wait until everything is done which definitely is a plus. One thing that neither formats can do is pass parameters through to each other. The only way to get data across chain links is to use the instance variables we talked about above.

But, what if we can take things further? What if we were to combine the good parts of both AND add more? Sometimes you have to do things others wouldn’t dare to do!
``` javascript
class BestChainer {
  constructor()  {
    this.waits = 0;
    // this is the beginning of the chain
    this.queue = Promise.resolve();
  }

  // lets define the 'then' function we have been using
  // now our AsyncChainer can do what Promises do!
  then(callback) { callback(this.queue); }

  // schedules a callback into the task queue
  // basically builds the following:
  // o.then(o => o.then(o => o.then(o => o.then(Promise.resolve())))
  chain(callback) {
     return this.queue = this.queue.then(callback);
  }

  // one way to pass value
  chainedAsyncWait = () => {
    this.chain(async () => {
      await asyncWait();
      console.log(this.waits++);
    });
    return this;
  }

  // another way to pass value
  chainedAsyncCalc = (y) => {
    this.chain((x) => {
      console.log(x);
      if (!x) { x = y; }
      return x * x;
    })
    return this;
  }
}

(async () => {
  const chainer = new BestChainer();

  x = await chainer.chainedAsyncWait()
         .chainedAsyncWait()
         .chainedAsyncWait()
         .chainedAsyncWait()
  console.log('Finished chains', x);

  x = await chainer.chainedAsyncCalc(2)
         .chainedAsyncCalc()
         .chainedAsyncCalc()
         .chainedAsyncCalc()
  console.log('Finished chains', x);
})();
// output :: 0 1 2 3 Finished chains undefined
//           undefined 4 16 256 Finished chains 65536
```
How neat is this! We were able to use our neat little chaining pattern, and bring in a new manner of passing data down the pipeline! Let’s talk about why this works.

First we implement a then method. This makes our `BestChainer` class be able to use await. Very important for us to make sure our code waits until the whole chain resolves. It is an optional feature and does not need to be included, it will not affect the next property.

We next implement a chain method. Inside, we are telling our queue, whatever it may be, to run a given callback when it resolves (using then from `Promise`, not the one we just wrote). The result of telling the queue to do this results in a new `Promise`, which becomes the next piece of our queue. From there, you can imagine the queue building outward as so:

`o4.then(o3 => o3.then(o2 => o2.then(o1 => o1.then(Promise.resolve())));`

If you think about it, this is a lot like recursion! Instead of a callstack, we are pushing promises onto each other. With a Promise.resolve at the end, we have our base case that tells it to stop running. Note this is set in the constructor, very important or your code will not run.

Another cool property is that these Promises we are chaining up will resolve to a value. This means any given link in this chain will be able to receive the return value from the from the link before it(the first will be undefined).

One thing I am wondering, is how we can find a way to stop the chain from executing. I have tried before to figure this out and I cannot seem to find a way other than using throw. This is perfect for the negative case, an error for example. But what if we have satisfied a number of conditions and have done enough work? A return style exit out of the chains would be great. I must do more research on how something like this can happen.

## Can I See An Application of this Pattern in the Real World?

At this point of the article, I must level with you: the reader. The reason I had done all this thinking and coding surrounding this pattern is to explore how to use Javascript differently. Everyone has written an API in Express. With such a solid API REST pattern my company has, I of course do my best to use it.

The Router->Controller->Service dependency injection just rocks. I will put a link to an article HERE if I can remember/find one. Essentially the idea is a router uses controllers that call service methods. Controllers hold human/business logic that makes sense in an application context. The controller methods are made up of small service methods that are computer/system logic. Here is an example:

- Your app has an endpoint called `/renewId?employee=hgKing`
- The router has logic that will envoke the renew method for `IdController`
- Inside that renew method are lots of database calls that live in many different services: `IdService`, `EmployeeService`, etc.
- The stack of logic in different parts do its best to renew the employee ID.

A application system has intimate knowledge of database calls, entities, models. These details are things you want to hide away in your controller and services. This is the awesome part of the API pattern.

Part of me wonders, though, how it can be improved upon. One thing I noticed is the `Router->Controller` interface. I wanted to see if there was a way to improve the visibility within the Controller. You can imagine in the Router having code like so:
``` javascript
app.get('/renewId', (req, res) => {
  try {
    res.send(
      idController.renew(req.query.employee)
    );
  } catch (e) {
    res.send(e.message);
  }
})
```
Pretty straight forward right? Lots of good stuff here. Simple black box implementation; the try catch is a great way to get error messages out from the server. But, you can imagine the renew method being enormous. What even is going on in there? Beats me. How can we get around this?

Why chaining of course! Imagine a world like this:
``` javascript
app.get('/renewId', (req, res) => {
  try {
    res.send(
      idController.startRenew(req.query.employee)
                  .isValidEmployee()
                  .hasId()
                  .generateId()
                  .updateRecords()
                  .results()
    );
  } catch (e) {
    res.send(e.message);
  }
})
```
How much better is that? We can see all sorts of great info that was originally hidden. Each of those bits being a method cuts down on huge blocks of logic. You can remove or reorder any of those links in the chain at any time if you used good practices in your functions. At any point, those chains can throw and error, like `isValidEmployee()` could `throw InvalidEmployeeError('User hgKing is not a valid employee')`. All around great in my eyes! I have been trying to implement things like this in my projects lately and will come back later to this article to make an addendum to report more findings.

Thanks for reading!
