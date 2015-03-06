public class StringArrayTest {

    public static String[] generateStringArray(Integer max) {
        String[] colors = new List<String>();
        for (Integer i = 0; i < max; i++) {
            colors.add('Test ' + i);
        }
        
        return colors;
    }
}