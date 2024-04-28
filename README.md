---
Name: V8BET APIs,
Description: Practical Trial APIs
URL: https://github.com/megabreakage/Value-Bet-API
Authors: Martin Njuguna.
Initial Date: 15 April 2024.
---

# [V8BET APIs](http://localhost:4000)

Application Programming Interface for Practial Trial, by Value8!

---

## Installation

Built on Elixir's Phoenix Framework, and sits on MYSQL Database.

### a. Pre-requisites

For a complete and successful installation ensure your machine is ready with the following applications. You can find the installation processes for all environments (Windows, Linux & MacOs) from online documentation.

1. Elixir 1.14.\* or later
2. MYSQL instance

### b. Installation Steps

Follow the steps below to successfully intall the application.

1. Clone project repository _(make sure you have the right permissions)_ ,

    ```bash
    git@github.com:megabreakage/Value-Bet-API.git
    ```

2. Create a new git branch from master using this command

    ```bash
    git checkout -b <your-new-branch-name>
    ```

5. Create a Database on your local/remote/ server or machine and call it **v8bet_api_dev**,
6. Open your **devs.exs** file in **config** folder and use the credentials used in creating your database to update; _`username`_, _`password`_ & _`database`_ . Remember to save the **dev.exs** file,
7. Run the following command to set up your application, create database and run migrations.

    ```bash
    mix deps.get
    ```
    
    ```bash
    mix ecto.create
    ```

    ```bash
    mix ecto.migrate
    ```

8. Start your application by running the following command

    - Open terminal one and run this command:

        ```bash
        iex -S mix phx.server
        ```

9. Access your APIs via the IP generated e.g [127.0.0.1:4000](http://127.0.0.1:4000) or [localhost:4000](http://localhost:8000).

---

Best Regards,

**Martin Njuguna.**

