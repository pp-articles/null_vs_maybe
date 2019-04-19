public class SearchFirstNonNullTest {

    static Double discountFromNet ( String customerID ) {
        // fake implementation for test purposes
        return customerID.equals ( "Net" ) ? 10.0 : null;
    }

    static Double discountFromDB ( String customerID ) {
        return customerID.equals ( "DB" ) ? 7.0 : null;
    }

    static Double discountFromCache ( String customerID ) {
        return customerID.equals ( "Cache" ) ? 5.0 : null;
    }

    static Double customerDiscount ( String customerID ) {
    
        Double result = discountFromNet ( customerID );
        if ( result != null ) return result;
    
        result = discountFromDB ( customerID );
        if ( result != null ) return result;
    
        result = discountFromCache ( customerID );
        if ( result != null ) return result;
    
        return 0.0; // default value
    }

    static void runTest ( String customerID ) {
        Double result = customerDiscount ( customerID );
        System.out.println ( customerID + ": " + String.format ( "%.2f", result ) );
    }

    public static void main ( String[] args ) {
        runTest ( "Net" );
        runTest ( "DB" );
        runTest ( "Cache" );
        runTest ( "Foo" );
    }
}
