# Survey Exercise

Survey Exercise is a modern Rails 7 application for creating and answering yes/no surveys. It features a clean, mobile-friendly UI, real-time-like updates via Turbo Streams, and a modular, maintainable codebase using ViewComponent. The app is designed for rapid feedback collection and easy extensibility.

---

## Features

- **Create yes/no surveys** with a simple, intuitive form
- **Instantly answer surveys** with a single click
- **Live-updating survey list and statistics** using Turbo Streams (no page reloads)
- **Empty state UI** for when no surveys exist
- **Responsive, mobile-first design** (Tailwind CSS)
- **Component-based architecture** with ViewComponent
- **Comprehensive RSpec test suite** (request, system, and component specs)

---

## Installation

### Prerequisites

- Ruby 3.2.2+
- Rails 7+
- PostgreSQL

### Setup Steps

1. **Clone the repository**
    ```sh
    git clone https://github.com/dmitryjum/survey_exercise.git
    cd survey_exercise
    ```

2. **Install dependencies**
    ```sh
    bundle install
    ```

3. **Set up the database**
    ```sh
    bin/rails db:create
    bin/rails db:migrate
    ```

4. **Start the Rails server**
    ```sh
    bin/dev
    # or
    rails s
    ```

5. **Visit the app**
    Open [http://localhost:3000](http://localhost:3000) in your browser.

---

## Running the Test Suite

1. **Prepare the test database**
    ```sh
    bin/rails db:test:prepare
    bin/rails db:create
    bin/rails db:migrate
    ```

2. **Run RSpec**
    ```sh
    rspec
    ```

- The test suite covers controllers (request specs), system/browser flows (system specs), and ViewComponents (component specs).

---

## Project Structure

- `app/controllers/surveys_controller.rb` — Handles survey limited CRUD and Turbo Stream responses.
- `app/controllers/responses_controller.rb` — Handles survey answers and Turbo Stream updates.
- `app/models/survey.rb` — Survey model and stats logic.
- `app/models/response.rb` — Response model with enum validation.
- `app/components/` — ViewComponents for survey rows, answer forms, and stats.
- `app/views/surveys/index.html.erb` — Main survey page.
- `app/views/surveys/create.turbo_stream.erb` — Turbo Stream updates for survey creation.
- `app/views/responses/create.turbo_stream.erb` — Turbo Stream updates for answering surveys.

---

## Design Considerations

- **Turbo Streams:** Enables partial page updates for a snappy, modern UX without full reloads.
- **ViewComponent:** All UI elements are encapsulated in reusable, testable components.
- **Validation:** Only "yes" or "no" answers are accepted; invalid submissions are rejected.
- **No authentication:** The app is currently open to all users.

---

## Future: User Authentication & Features

This project may benefit in the future from authentication and user models. If implemented, the following strategies and features are recommended:

### User Features (Potential)

1. **Account Creation:** Users can register for an account.
2. **Login/Logout:** Users can securely log in and out.
3. **Survey Ownership:** Surveys are associated with the user who created them.
4. **Answer Permissions:** Users cannot answer their own surveys, only those created by others.
5. **Response Ownership:** Responses are linked to the user who answered.
6. **UI Permissions:** The UI will visually restrict users from answering their own surveys (e.g., disabling or hiding answer options).
7. **Survey Management:** Users can view, edit, or delete only their own surveys.
8. **User Dashboard:** Each user can see their created surveys and responses.
9. **Admin Features (optional):** Admins can moderate surveys and responses.
10. **Pagination:** Add a "Load More Surveys" button to support infinite scrolling or progressive loading of surveys, improving performance and user experience for large datasets.

**Implementation Strategies:**
- Use Devise or similar gem for authentication.
- Add `user_id` foreign keys to surveys and responses.
- Use Pundit or CanCanCan for authorization.
- Update Turbo Stream logic to respect user permissions.
- Add system and request specs for user flows and permissions.

---

## Notes

- **Testing:** Uses RSpec, Capybara, and ViewComponent test helpers for robust coverage.
- **Styling:** Tailwind CSS for rapid, responsive UI development.
- **Extensibility:** The codebase is modular and ready for new features, such as authentication, survey types, or analytics.