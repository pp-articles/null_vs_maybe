public class NullNotAllowedTest {

    static String intToString ( Integer i ) {
        return i == 1 ? "one" : "not one";
    }

    static String intToString2 ( Integer i ) {
        if ( i == 1 ) {
            return "one";
        } else {
            return "not one";
        }
    }

    static String intToStringWrong ( Integer i ) {
        return null;
    }

    public static void main ( String[] args ) {
        System.out.println ( intToString ( 1 ) );
        System.out.println ( intToString ( 2 ) );
        // System.out.println ( intToString ( null ) );

        // System.out.println ( intToStringWrong ( 1 ) );
        // System.out.println ( intToStringWrong ( 1 ).length() );
    }
}
