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

### 02. Run the CreateGenre database migration ###

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

### 04. Generate migration for Movie ###

Generate a migration file. This will be then edited to modify Movie with an
additional column to connect to Genre

```
$ rails generate migration AddGenreToMovie
      invoke  active_record
      create    db/migrate/20130322114045_add_genre_to_movie.rb
```

### 05. Run the AddGenreToMovie database migration ###

Apply the update to movies by running `rake db:migreate`

```
$ rake db:migrate
==  AddGenreToMovie: migrating ================================================
-- add_column(:movies, :genre_id, :integer)
   -> 0.0006s
-- add_index(:movies, :genre_id)
   -> 0.0006s
==  AddGenreToMovie: migrated (0.0013s) =======================================
```
