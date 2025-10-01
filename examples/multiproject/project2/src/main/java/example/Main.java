package example;

public class Main
{
   public static void main(final String[] args) throws Exception
   {
      System.out.println(new com.google.gson.Gson().toJson(ImmutablePerson
            .builder()
            .name("John")
            .age(42)
            .build()));
   }
}
