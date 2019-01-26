workflow "Build & Release" {
  on = "push"
  resolves = "Container Release"
}

action "Create Release" {
  uses = "./.github/mix"
  args = "do deps.get, compile, release"
  env = {
    PORT = "4000"
  }
  secrets = ["COOKIE"]
}

action "Registry Login" {
  uses = "./.github/heroku"
  needs = "Create Release"
  args = "container:login"
  secrets = ["HEROKU_API_KEY"]
}

action "Container Push" {
  uses = "./.github/heroku"
  needs = "Registry Login"
  args = "container:push web --app ping-ex"
  secrets = ["HEROKU_API_KEY"]
}

action "Container Release" {
  uses = "./.github/heroku"
  needs = "Container Push"
  args = "container:release web --app ping-ex"
  secrets = ["HEROKU_API_KEY"]
}
