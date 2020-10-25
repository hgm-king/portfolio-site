# Sitename

This is the beginnings of a site. The idea here is to have 3 pages:
### Home
Some form of a homepage that leads to the other pages, ideally showing a small snippet of other interesting information as well as a little bit of contact info.
### Images
A gallery-style page of many images in the form of thumbnails, where the user can click on a thumb-nail and get a larger view and maybe a little more information about the photo.

The images are going to be fed from the `/assets/images/` directory. Any image in there will be show in the gallery. Maybe going forward, we can have a system that will hold metadata about each file, such as a description, title, preferred size, date, etc. We will tackle this later.

### Papers
A blog style page that will have many links to papers, upon which  the user can click on to navigate to view the paper in its entirety. Ideally the papers will be in markdown format, but a caveat there is we need something to do the translation from markdown to html. It is not all that easy to translate every single paper into html so we can try markdown for now.

These papers will be fed from the `/assets/papers/` directory such that every file in there will be displayed.


#### Project Layout
- `public-html` is a folder that will be used for serving static assets like html, css, images, and javascript. You will find our main css file that will be providing all styles for the entire app. Additionally you will find a symbolic link to the `assets/images/` folder so that we can keep our code dry.
- `cgi-bin` is a folder that holds the brains of our project. Our server will execute the file with the same name that a user navigates to in their browser. These files we are writing are written in Perl, a neat language from the 80's.
- `assets` is a folder that will hold the content that our project will be presenting. There are `images` and `papers` that each will source content for our programs with the same name in `cgi-bin`.
