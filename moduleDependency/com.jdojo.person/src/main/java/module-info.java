// module-info.java
module com.jdojo.person {
    // Read the com.jdojo.address module
    requires com.jdojo.address;
    // Export the com.jdojo.person package
    exports com.jdojo.person;
}