package com.jdojo.address;

public class Address {
    private String line = "1111 Main Blvd.";
    private String city = "Jacksonville";
    private String state = "FL";
    private String zip = "32256";

    public Address() {

    }

    public Address(String line, String city, String state, String zip) {

        this.setLine(line);
        this.setCity(city);
        this.setState(state);
        this.setZip(zip);

    }


    @Override
    public String toString() {
        return "[Line1:" + getLine1() + ", State:" + getState() +
                ", City:" + getCity() + ", ZIP:" + getZip() + "]";
    }

    public String getLine1() {
        return line;
    }

    public void setLine(String line) {
        this.line = line;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }
}
