package example;

import org.immutables.value.Value;

@Value.Immutable
public interface Person
{
   String name();

   int age();
}
