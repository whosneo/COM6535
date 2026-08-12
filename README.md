# Fitness for Students

A student fitness community web app built for **COM6535** (University of Sheffield). Users share posts about **Exercise**, **Diet**, and **App** recommendations, interact with likes/replies/polls, and manage profiles in a moderated forum-style environment.

---

## Features

| Area | Capabilities |
|------|----------------|
| **Posts** | Create, browse, and search posts by type (Exercise / Diet / App) |
| **Engagement** | Likes/dislikes (polymorphic on posts & replies), replies, polls |
| **Apps** | App-type posts with icons & ratings; app requests for managers |
| **Search** | Keyword search and advanced search with sorting |
| **Profiles** | Personal home page, avatar (Active Storage), public user pages |
| **Moderation** | Reports, admin role, block/unblock users |
| **Auth** | Devise (email/password); LDAP/CAS adapters available in the stack |

### Tech stack

- **Ruby** 2.4.4 · **Rails** 5.2.1
- **DB**: SQLite (dev/test) · PostgreSQL (deploy)
- **Frontend**: Haml, Bootstrap (Sass), jQuery, Font Awesome, Select2
- **Auth & authz**: Devise, CanCanCan
- **Background jobs**: Delayed Job
- **Tests**: RSpec, Capybara, Factory Bot, SimpleCov
- **Deploy**: Capistrano + `epi-deploy` (QA → Demo → Production)

---

## Development setup

### Prerequisites

- Ruby `2.4.4` (see `.ruby-version`)
- Bundler
- SQLite3 (development) or PostgreSQL (optional)

### Install

```bash
bundle install
```

### Database

Copy a sample config, then create, migrate, and seed:

```bash
# SQLite (default for local development)
cp config/database_sample-sqlite.yml config/database.yml

# or PostgreSQL
# cp config/database_sample-pg.yml config/database.yml

rails db:create
rails db:migrate
rails db:seed
```

### Run the app

```bash
rails server
# or
bundle exec thin start
```

Visit [http://localhost:3000](http://localhost:3000).

### Tests

```bash
bundle exec rspec
```

Security scan (optional):

```bash
bundle exec brakeman
```

---

## Project layout (high level)

```
app/
  controllers/   # posts, replies, likes, reports, polls, users, app_requests
  models/        # Post, User, Reply, Like, Report, Rating, Poll*, AppRequest
  views/         # Haml templates + Devise layouts
  decorators/    # Draper presenters
config/
  routes.rb
  database_sample-*.yml
db/
  migrate/
  seeds.rb
spec/            # RSpec feature & model specs
```

---

## Deployment

Pipeline: **QA → Demo → Production** via the `epi-deploy` gem and Capistrano.

```bash
# typical Capistrano flow (environment-specific)
bundle exec cap <stage> deploy
```

Ensure production uses PostgreSQL and correct secret/credentials configuration.

---

## Notes

- Post types are an enum: `Exercise`, `Diet`, `App`.
- App posts require an attached app icon and support ratings / ranking.
- Likes are polymorphic (`Like` → post or reply).
- Some original university contact / course deployment details may no longer apply outside the COM6535 environment.

---

## License / course context

University of Sheffield COM6535 team project (2018–19). History on branch `main` has been rewritten for author attribution and [Conventional Commits](https://www.conventionalcommits.org/) message style.
