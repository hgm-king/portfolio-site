# Scrappy & Lean for Teams
### An examination of mindset and methodology to build success
##### HG King
##### August 2020

## Intro

Today we are going to discuss two ideas that have brought a bit of success to my work recently. Due to the coronavirus pandemic arriving unannounced here in NYC and certain other places in the US, my team and I had to respond in almost real time. By being *scrappy* and *lean*, we were able to keep up and make a difference delivering vital data to state governments all across the country. Even the governor of New York referenced our work in a New York Times article, which is pretty neat.

To me, scrappy and lean are mindsets that you can have towards an objective. Being *scrappy* means making aggressive and courageous decisions; doing whatever it takes to succeed without fear of failure. I think of a boxer or a fighter pilot. *Lean*, on the other hand, is working **lightly**, efficiently, and smart. Everything is well thought out and executed with swift skill. These two ideas combined make for a formidable methodology to create success in building a product. Aspiring to make big moves pushes your product ahead. Working efficiently and quickly lets you build and adapt better.

With these things in mind, it should make sense to now discuss how we can embody the scrappy and lean lifestyle. It is an attempt to align a team in a way that will ease fundamental pain points. Some things require taking an introspective look into so that we can understand their importance. I use software as an example, since that is the field I am in. These ideas certainly pertain to any type of product one aspires to build. Starting off, let's look at fundamental challenges that we face when working with a team.

## Challenges

### Intro to Work
##### There is work to be done. We want to do positive work and avoid negative work to make a big impact.

> In physics, **work** is the process of energy transfer to the motion of an object via application of a force, often represented as the product of force and displacement. A force is said to do positive work if (when applied) the force has a component in the direction of the displacement of the point of application. A force does negative work if the force has a component opposite to the direction of the displacement at the point of application of the force.[1](https://en.wikipedia.org/wiki/Work_(physics))

Neat. This definition is very literal. Using some imagination, we can turn it into a reasonable analogy for building a product. Picture, if you will, an assembly line. At the beginning, you start with *nothing*; at the end, you have a finished *thing*.  As this thing moves along the assembly line, work is done. Each new piece added is considered **positive work**, pushing the thing forward. What if a step was not performed correctly? Say, a screw was forgotten or a piece had broken off. Well, the thing must go back to a certain phase of the assembly line for repair in order to keep moving. This is **negative work**. At the end of the assembly line, you have a finished product. Namely, a product of all the work done to build it!

Since that analogy worked out well, let us try another. This time we will do *impact*.
> In mechanics, an **impact** is a high force or shock applied over a short time period when two or more bodies collide. Such a force or acceleration usually has a greater effect than a lower force applied over a proportionally longer period.[2](https://en.wikipedia.org/wiki/Impact_(mechanics))

Looking at this definition, there are two inversely proportional variables here that make up impact: force and time. One can achieve an equivalent amount of impact with a lot of force at a slow pace as with a small force very quickly. In our context, the thing making the impact here is the product. In order for it to be successful, the impact must be great. **Our goal here is to build a product as impactful as possible**. We need to get the most force in the smallest amount of time. How do we do things as quick as possible? *Minimize our negative work* and *maximize positive work*. How do we increase our force? By being almost irresponsibly aggressive with choosing our objectives.

### Connection to Teams
##### Teams make room for a lot of error. How can we effectively avoid making mistakes?

Now let's move away from the assembly line towards a human team. Unfortunately, we humans are so great at making mistakes, there even is a type of error named after us (human error)! The only thing worse than one human making mistakes are many humans making many mistakes. Everyone is well aware that strength lies in numbers. *The Mythical Man Month* by Frederick P. Brooks Jr. tells us this is not the case with complex systems. In fact, effort increases as a function of `n(n-1)/2` as the number of workers increase. **Intercommunication** becomes the challenge at hand. A team of 3 needs 3 conversations to be on the same page while teams of 7 need 21! The extended Murphy's law is stated as:
> "With many moving parts and many people to break them, expect to do a lot of fixing"

Software is unforgiving in this respect, as many issues tend not to immediately show themselves. A team member performing a change to the code could unknowingly cause more damage than the change is even worth. To achieve our goal as stated above, we must minimize our negative work and maximize positive work. How can we overcome these fundamental difficulties in order to avoid making mistakes that take up extra time and effort?

### Lewis & Clark In the Dark
##### Products do not have a linear path from start to finish. How do we navigate these tough decisions?
I will not attempt to add any profound insight to the cause of difficulties in building software products. There are far too many books that do a much better job. One thing I do want to consider, though, is the importance of a good roadmap. A fail to plan is a plan to fail! In an ideal world, a complete roadmap is prepared and curated before the project starts. The chance of disaster is much lower with a clear direction. The proverbial Lewis and Clark, in the dark, get nowhere.

One big caveat is the content of your roadmap. One could have the most thorough and extensive plan for a product, but unless the proper things are planned the work will not be useful. This may be the toughest part, since it takes courage to plan ambitious, difficult things and then try to execute them. It is not so easy to build the perfect roadmap. How can we know the work we plan and do is impactful and will add value to our product?

## Strategy
Now that we have the right background knowledge and proper questions posed, let us look to solutions. My answers to each of the above questions are the following:
- Use **[Test Driven Development](https://en.wikipedia.org/wiki/Test-driven_development)** to avoid mistakes, work more confidently, and strengthen your codebase. I.e. be *scrappy*.
- Setting up **(Objective/Key-Results)[https://medium.com/startup-tools/okrs-5afdc298bc28]** lets a team be hyper-focused on goals and objectives, making it easier to weed out wasteful work. I.e. be *lean*.

### TDD
To me, **Test Driven Development** means to base all of your development through testing. To build a feature is to **first create tests** that document and assert the functionality, then work towards passing the test cases. In the coming months, I will write up on this topic in depth. To be *scrappy*, TDD should be the governing methodology of all development your team does. Let us examine what makes that so.

##### Asserts your correctness and adds confidence
The most common reason for testing your code is to make sure it *works*. This is a very basic but impactful property of tests; it might even be the most important. Creating proper and useful testing scenarios will assure that your product will behave the way you expect it. Knowing this, a team can be confident that their code will work. This reduces risk and allows work to focus on new features.

##### Protection from yourself and teammates
One challenge we posed above states that humans tend to break complex things easily. Nothing, in my opinion, is a better combatant of this than solid test suites. It is your *immune system*, defending your code against side affects and mistakes. It is not possible for your team to know of everyone's work. Tests deter people, including yourself, from making changes to code that works perfectly fine.

##### Doubles as documentation
Not many people think of it this way, but tests do a fantastic job *documenting* code. They show you exactly how everything is supposed to work. You would be surprised at how many times tests have helped me figure out how to use something that my team members  had written. Whenever I am learning a new framework or tool, I immediately read through the tests to see how it should be used. This comes in handy for large teams, especially if the personnel is changing.

### OKR
**Objectives & Key Results** are a full team effort that should be set forth from the **beginning** of a project. It is assumed that you have read the link above where the idea is introduced. OKRs in my opinion provide a lot of value from not too much work. In contrast to TDD, which involves actively writing tests and changing the structure of development, OKRs are just consulted after their creation. Like above, this topic will have its own in depth analysis. Using OKRs allows you to work *lean* as well as focus on impactful work.

##### Without clearly defined objectives, work loses its meaning
The OKR article talks about fractal or tree patterns. Your objectives each are broken down into sub-objectives, which may in turn have sub-objectives themself. This means each and every objective can be followed up to the root objective. I am sure that each company has its high level objectives that use big, abstract words like "drive innovation" or "think forward". What do these phrases mean? To your average Joe Programmer, it makes no sense day to day. How will they know if their work is meaningful? The tree pattern allows this person to analyze every unit of work, asking if it aligns with each objective all the way to the abstract top. This becomes a powerful tool, a theoretical *Occam's Scissors*, that can be used to trim away unnecessary work.

##### Expectations for each team member
This tree pattern has another beneficial property that is the *correlation* to a company structure. A company breaks down into departments, teams, and individuals. These objectives could match the structure of the company, giving each entity their own personal goals. No matter where you sit in the company, you can easily find where your work comes into play.

##### A way to quantify success
It was briefly mentioned above, but an issue for team members is knowing if their work is making a difference. This deserves its own section. Each team, being different, has different criteria for success. The entire reason for Objectives & Key Results is to quantify your performance in order to clearly see progress. For any member of a team, this brings forth a refreshingly motivating culture. There is a shift that allows the person doing the work to review their own progress and value at any moment. Very different from the yearly reviews that are not as helpful as they could be.

## Conclusion
The reason this article was put together was to share the ever interesting phenomena of combining two good things and getting something better in return. It is my hope that the reader finds some sort of inspiration to try this out themselves. I wanted to bring to light a few challenges that other people may be having a tough time with, as well as solutions that may ease their pain.
