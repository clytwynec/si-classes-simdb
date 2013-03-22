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

## Part 08 - Multi Genre ##

### 01. Create the Movie / Genre join table migration ###

Create a migration that will be used for the join table.

```
$ rails g migration CreateMovieGenreJoin
      invoke  active_record
      create    db/migrate/20130322124335_create_movie_genre_join.rb
```

### 02. Run the join table migration ###

```
$ rake db:migrate
==  CreateMovieGenreJoin: migrating ===========================================
-- create_table(:genre_movie, {:id=>false})
   -> 0.0335s
==  CreateMovieGenreJoin: migrated (0.0336s) ==================================
```

### 03. Create a migration to drop the genre_id colum from Movies ###

```
$ rails g migration DropGenreFromMovies
      invoke  active_record
      create    db/migrate/20130322125010_drop_genre_from_movies.rb
```

### 04. Run the migration ###


```
$ rake db:migrate
==  DropGenreFromMovies: migrating ============================================
-- remove_column(:movies, :genre_id)
   -> 0.0885s
==  DropGenreFromMovies: migrated (0.2793s) ===================================
```

## Part 09 - Add Director ##

### 01. Generate Person model ###

```
$ rails g model Person
      invoke  active_record
      create    db/migrate/20130322132531_create_people.rb
      create    app/models/person.rb
      invoke    test_unit
      create      test/unit/person_test.rb
      invoke      factory_girl
      create        test/factories/people.rb
```

### 02. Add Director to Model ###

```
$ rails g migration AddDirectorToMovie
      invoke  active_record
      create    db/migrate/20130322133252_add_director_to_movie.rb
```

### 03. Run Migrations ###

```
$ rake db:migrate
==  CreatePeople: migrating ===================================================
-- create_table(:people)
   -> 0.0320s
==  CreatePeople: migrated (0.0321s) ==========================================

==  AddDirectorToMovie: migrating =============================================
-- add_column(:movies, :director_id, :integer)
   -> 0.0006s
==  AddDirectorToMovie: migrated (0.0007s) ====================================
```

## Part 10. Add Roles ##

### 01. Generate Role Model ###

```
$ rails g model Role
      invoke  active_record
      create    db/migrate/20130322135917_create_roles.rb
      create    app/models/role.rb
      invoke    test_unit
      create      test/unit/role_test.rb
      invoke      factory_girl
      create        test/factories/roles.rb
```


