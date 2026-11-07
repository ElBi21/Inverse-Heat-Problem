# Inverse Problem for the Heat Equation

The scope of the project is to train a JAX neural network for approximating, given the heat equation, a parametric map in the form:
$$
(\bold{x}, t, \mu) \mapsto u (\bold{x}, t, \mu) \quad\quad \text{where} \quad \bold{x} \in \Omega, \; t \in [0, T], \; \mu \in [\mu_{\min}, \mu_{\max}]
$$

## Organizing the source code

All your sources are located into the `src` folder. Any binary file will have to be compiled (instructions are further in the README). Any `gmsh` file needed can be downloaded with the appropriated recipe by an external source.

> [!NOTE] **Prerequisites**
> The project uses JAX for the training and inference of the model: for this reason, we use `uv` to administer all Python packages. We advi

The project comes with a Makefile, which handles the preparation, build, and run stages. In particular, the recipes are the following:

- `prepare`: downloads `uv` and all the necessary tools through it;
- `train`: trains the model with `JAX`;
- `infer`: performs inference through the model.

## Running the code

1. If you have `uv` installed, then the Makefile will use it, otherwise it will download it and place it in a folder called `tools` in the repo root. After that, the packages will be downloaded through the command below:
```sh
make prepare
```
