# JekyllValidator

JekyllValidator is a gem that helps you validate the output of your Jekyll website every time it's generated. I got the idea from my blog post ["Automating HTML Validation for a Happier Life"](https://seoengr.net/2023/04/20/automating-html-validation.html "Automating HTML Validation for a Happier Life"), which includes a simple bash script to automate the process. I created this plugin to enhance the platform I use with better functionality. I incorporated CSS Validation to achieve this, using the language that I adore.

## Usage

Add the following to your site's Gemfile

    gem 'jekyll-validator'

And add the following to your site's _config.yml

    plugins:
        - jekyll-validator

It is possible to exclude files from the validation process:

    validator:
        exclude: 
            - 'assets/css/main.css'

## Contributing

- Fork the project
- Create a descriptively named feature branch
- Add your feature
- Submit a pull request

## Code of Conduct

Everyone interacting in the JekyllValidator project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/jekyll-validator/blob/main/CODE_OF_CONDUCT.md).
