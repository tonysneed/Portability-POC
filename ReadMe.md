# Portability POC

Demonstrates how to decompile a .NET 4.5 assembly and recompile as a .NET Standard assembly that can be run on .NET Core.

- This demo uses ILSpy console decompiler.
  - ILSpy repository: https://github.com/icsharpcode/ILSpy/tree/master/ICSharpCode.Decompiler.Console
  - As a temporary workaround for a known [issue](https://github.com/icsharpcode/ILSpy/issues/1412), we are building a local version of the decompiler.

- The .NET Core console app references the .NET Standard assembly that has been re-targeted from .NET 4.5 to be compatible with .NET Core.

- The **Dockerfile** contains instructions for decompiling the .NET 4.5 assembly, then recompiling as a .NET Standard assembly.
  - We then build and deploy the .NET Core console app.

- Build the docker image.

    ```
    docker build . -t consoleapp-2.2
    ```

- Run the docker image.

    ```
    docker run -it --rm --name consoleapp consoleapp-2.2 sh
    ```

- Enter random text when prompted, then the program will reverse the input characters.
  - Press `Ctrl+C` to end the program and remove the container.
