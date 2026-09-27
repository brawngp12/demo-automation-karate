Install java 21+ https://download.oracle.com/java/21/latest/jdk-21_windows-x64_bin.exe
    - Create the JAVA_HOME VariableUnder the top section ("User variables for [Your Username]")
    - Click the New... button.   Fill out the fields:Variable name: JAVA_HOME  
    - Variable value: Paste the JDK path you copied in Step 1 (e.g., C:\Program Files\Java\jdk-21)

  mvn test -Dkarate.env=dev
  And if you want to run a specific test class or method at the same time:  
  # Run all tests in TestRunner with dev env
  mvn test -Dkarate.env=dev -Dtest=TestRunner

  # Run only the runSmoke method with dev env
  mvn test -Dkarate.env=dev -Dtest=TestRunner#runSmoke

# Run all tests
  mvn test
  
  # Run only @smoke tagged tests
  mvn test -Dkarate.options="--tags @smoke"
  
  # Run against staging environment
  mvn test -Dkarate.env=staging
  
  # Run specific runner method
  mvn test -Dtest=TestRunner#runSmoke