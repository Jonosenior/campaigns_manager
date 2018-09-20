# Campaigns Manager

This is a campaign manager. Users can create new campaigns, add todo lists to them, and comment on the campaigns and the todo lists. There are two types of user - Novices and Experts - with varying authorization levels.


## Notes

- For the User model, I went with Single Table Inheritance (STI). This means there is a single 'User' table in the database, and a User model, and models for Expert and Novice that inherit from User. The advantages of STI are saved DB space (as there's only one table), it's DRY, and it's easy to implement. It's appropriate for situations like this where most of the attributes between the user types are shared (the attributes that Novice doesn't hold are stored as nil in the database).

- Other options for the User functionality would have been to use Rolify (I decided against as it didn't seem possible to allow different attributes based on the User role), or to use Polymorphic Associations with separate User tables for each type of User. I decided against the latter as it seemed overkill in this context.

 - I used Devise to handle authentication and CanCanCan to handle authorization.

## Remaining Tasks / Things to improve

- Clearly the testing coverage is very poor (only a few model tests at the moment). I will add more tests when I have time.
- Bootstrap to make the frontend look passable.
- The TodoList / Todo functionality is messy. Users can add Todo Lists, but at the moment they can't add Todos themselves. I'll implement this with a nested form (which is not that complicated), so the TodoList and the individual Todos can be added at the same time.
- The routes and associations for the Comments are not yet fully functional. At the moment users can only comment on Campaigns (when the project is finished, they will also be able to comment on certain Todo Lists). I need to experiment with this, but it's possible that the structure is currently wrong, and that I need to use polymorphic associations so that comments can be left on more than one type of thing (Todo Lists AND Campaigns). Ran out of time on this one.
- Adding some JS to make the forms dynamic would be nice (eg creating new Todo fields without navigating to a whole new page).
- Deployment to Heroku (when it's finished).
- A seeded database (so users can explore it with full functionality).
