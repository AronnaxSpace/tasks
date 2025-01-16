# Tasks

### Requirements

- Ruby 3.4.1
- Bundler 2.4.5
- PostgreSQL
- Node.js
- Yarn

### Setup

#### 1. Clone the repository

```bash
git clone git@github.com:AronnaxSpace/tasks.git
```

#### 2. Set environment variables

- Install [direnv](https://direnv.net/)
- Create an `.envrc` file and set the following variables: `TASKS_DATABASE_USERNAME`, `TASKS_DATABASE_PASSWORD`

#### 3. Install dependecies

```bash
bundle && yarn
```

#### 4. Setup the database

```bash
rails db:setup
```

#### 5. Start the application

```bash
foreman s -f Procfile.dev
```
