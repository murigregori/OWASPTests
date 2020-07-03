# OWASPTests
OWASP Automated Tests

AUTOMATION WITH CUCUMBER, WATIR, AND RUBY (Windows, Linux, MacOS)

1. Download Ruby (https://www.ruby-lang.org/en/downloads/)
2. Download Chrome Driver and unzip the file in the ruby/bin folder
3. install the watir gem, the rspec gem, and the cucumber gem by running the following scripts in cmd
   
   gem install watir
   gem install rspec
   gem install cucumber
   gem install page-object

4. Clone the project from the public git repository to any destination
   
   https://github.com/murigregori/OWASPTests.git

5. After cloning the project, open the CMD and navigate to the /OWASPTests folder 
6. Once inside the OWASPTests folder, run the following script to run the tests:

   cucumber -r features features/owasp_tests.feature --format html --out <report_name>.html

7. Cucumber will then run the tests and make a report once the test run is done


FOLDER STRUCTURE:

  | OWASPTests
    | features
      | pages
      | step_definitions
      | support 
    | owasp_test.feature

* Pages - where Page Object Model files are stored
* step_definitions - where Step Definition file is stored
* support - where test configuration files are stored
