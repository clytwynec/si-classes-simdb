# Notes

## Part 07 - Add Genre ##

### 01. Generate the Genre model ###

This generates the model. Unlike `rails generate resource ResourceName`, this
only generates the model, database migration and tests. 

```
$ rails generate model genre
      invoke  active_record
      create    db/migrate/20130322105853_create_genres.rb
      create    app/models/genre.rb
      invoke    test_unit
      create      test/unit/genre_test.rb
      invoke      factory_girl
      create        test/factories/genres.rb
```

### 02. Run the database migration ###

After creating the database migration in ``, running migration will update the
database and `schema.rb`.

```
$ rake db:migrate
==  CreateGenres: migrating ===================================================
-- create_table(:genres)
   -> 0.0310s
==  CreateGenres: migrated (0.0310s) ==========================================
```

### 03. Seed the database ###

Seed the databaase to initialize it with some default values.

```
$ rake db:seed
```
