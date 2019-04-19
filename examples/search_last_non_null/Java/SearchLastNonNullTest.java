public class SearchLastNonNullTest {

    static class Customer {
    
        private String name;
        private Address address;
    
        public Customer ( String name, Address address) {
            this.name = name;
            this.address = address;
        }
    
        public String getName() { return name; }
        public Address getAddress() { return address; }
    }
    
    static class Address {
    
        private String city;
        private String country;
    
        public Address ( String city, String country) {
            this.city = city;
            this.country = country;
        }
    
        public String getCity() { return city; }
        public String getCountry() { return country; }
    }
    
    static Integer customerCitySize ( Customer customer ) {

        Address address = customer.getAddress();
        if ( address == null ) return 0;
    
        String city = address.getCity();
        if ( city == null ) return 0;
        
        return city.length();
    }

    public static void main ( String[] args ) {

        // city is non-null
        Address address = new Address ( "Orlando", "USA" );
        Customer customer = new Customer ( "Foo", address );
        System.out.println ( customerCitySize ( customer ) );
    
        // city is null
        address = new Address ( null, "USA" );
        customer = new Customer ( "Foo", address );
        System.out.println ( customerCitySize ( customer ) );
    
        // address is null
        customer = new Customer ( "Foo", null );
        System.out.println ( customerCitySize ( customer ) );
    }
}
