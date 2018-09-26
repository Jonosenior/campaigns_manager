# Campaigns Manager

This is a campaign manager. Users can create new campaigns, add todo lists to them, and comment on the campaigns and the todo lists. There are two types of user - Novices and Experts - with varying authorization levels.


## Notes

- For the User model, I went with Single Table Inheritance (STI). This means there is a single 'User' table in the database, and a User model, and models for Expert and Novice that inherit from User. The advantages of STI are saved DB space (as there's only one table), it's DRY, and it's easy to implement. It's appropriate for situations like this where most of the attributes between the user types are shared (the attributes that Novice doesn't hold are stored as nil in the database).

- Other options for the User functionality would have been to use Rolify (I decided against as it didn't seem possible to allow different attributes based on the User role), or to use Polymorphic Associations with separate User tables for each type of User. I decided against the latter as it seemed overkill in this context.

- I used Devise to handle authentication and CanCanCan to handle authorization.

- Comments were implemented using a polymorphic association - Campaigns and TodoLists both `has_many :comments as: :commentable`. The routes for comments are not nested under their commentable resource; I felt this would be too complicated, since the routes for TodoLists are themselves nested under Campaigns. It's usually bad form to nest a route three levels deep (the paths become insanely complicated), so I avoided doing so.

## Remaining Tasks / Things to improve

- Clearly the testing coverage is very poor (only a few model tests at the moment). I will add more tests when I have time.
- Bootstrap to make the frontend look passable.
- The TodoList / Todo functionality is messy. Users can add Todo Lists, but at the moment they can't add Todos themselves. I'll implement this with a nested form (which is not that complicated), so the TodoList and the individual Todos can be added at the same time.
- Adding some JS to make the forms dynamic would be nice (eg creating new Todo fields without navigating to a whole new page).
- Deployment to Heroku (when it's finished).
- A seeded database (so users can explore it with full functionality).
- Currently the User sign up form contains all User attributes for both kinds of User, but two of those are only appropriate for Experts. It should be possible to use JS to dynamically hide those fields depending on which User type button the user selects.

## Issues and Solutions

- **Issue**: A weird error was thrown when I tried to login or logout: 'Routing Error: uninitialized constant Sessions'. This seemed to be an issue with Devise rather than any code in my application.
    - **Solution**: The problem was caused by the `load_and_authorize_resource` line in my ApplicationController, which applies CanCanCan permissions throughout every controller. When I took this line out - and apply it instead to each Controller individually - the login/logout functionality seems to work. 
