# Coding Standards & Guidelines

# Agent Rules

- For every change, always follow the coding structure and architecture already in place for this project.
- The lines of code in a file should not exceed 200 lines.
- Helper classes and widgets should always be placed in an individual file dedicated to that class only, and that file should live in `features/[feature]/presentation/widgets/` when it is a feature-level reusable widget.
- Test files should keep separation of concerns as well, instead of placing all tests in a single file.
- Changes should always be implemented in a way that minimizes resource consumption and prioritizes performance optimization.
- Always use `fvm flutter` instead of `flutter` when running Flutter commands.
- Always use resusable component for general purpose UI components like deletion dialog, Option menu bottom sheet, buttons, header. They should differ by parameters if necessary.
- If a design file is provided, the proposed design should always be folloewd pixel-by-pixel, and the UI generated should look as closely the same as possinble to the provided design.
