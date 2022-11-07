# Compute Canada Environments

## Usage

In each project folder there is a `create_env.sh` script. This should be executed in the interactive shell, by calling it directly:

```bash
cd {project_name} && ./create_env.sh
```

Afterwards, it is possible to submit jobs with the provided scripts:

```bash
cd {project_name} && sbatch {script_name}.sh
```

Example:

```bash
cd leaps && sbatch run_leaps.sh
```