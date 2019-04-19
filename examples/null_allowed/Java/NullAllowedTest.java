public class NullAllowedTest {

    static String intToString ( Integer i ) {
        if ( i == null ) {
            return null;
        } else {
            return i == 1 ? "one" : "not one";
        }
    }

    static String intToString2 ( Integer i ) {
        return i == null ? null : i == 1 ? "one" : "not one";
    }

    static void displayResult ( String s ) {
        String result = s == null ? "null" : s;
        System.out.println ( "Result: " + result );
    }

    static void displayResultWrong ( String s ) {
        // System.out.println ( "Result: " + ( s == null ? "null" : s ) );
        System.out.println ( "Result: " + s == null ? "null" : s );
    }

    public static void main ( String[] args ) {
        displayResult ( intToString ( 1 ) );
        displayResult ( intToString ( 2 ) );
        displayResult ( intToString ( null ) );

        // displayResultWrong ( intToString ( 1 ) );
        // displayResultWrong ( intToString ( 2 ) );
        // displayResultWrong ( intToString ( null ) );
    }
}
