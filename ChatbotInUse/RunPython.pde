import java.util.concurrent.Future;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeoutException;

int runPythonScript(String script, String scriptArguments) {
  boolean isWindows = System.getProperty("os.name").toLowerCase().startsWith("windows");
  int exitCode = 0;
  
  final String PYTHON_INTERPRETER = "/Applications/Python 3.10";
  String command = String.format("%s %s %s", PYTHON_INTERPRETER, script, scriptArguments);
  
  
  ProcessBuilder builder = new ProcessBuilder();
  
  if (isWindows) {
    builder.command("cmd.exe", "/c", command);
  } else {
    builder.command("sh", "-c", command);
  }
  
  builder.directory(new File(dataPath("")));
  println("executing command " + builder.command());
  
  try {
    Process process = builder.start();
    StreamConsumer streamConsumer = new StreamConsumer(process.getInputStream(), System.out::println);
    Future<?> future = Executors.newSingleThreadExecutor().submit(streamConsumer);
    exitCode = process.waitFor();
    future.get(10, TimeUnit.SECONDS);
  }
  catch (IOException | InterruptedException  | ExecutionException | TimeoutException exception) {
    exitCode = -1;
  }
  
  return exitCode;
}
