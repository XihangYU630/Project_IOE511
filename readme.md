# [IOE 511 Project] 10 optimization algorithms with 12 applications

This is the course project by team "Gradient Pioneers" (Xihang Yu, Congyue Yang, Jiawen Li) for UMich IOE 511.

## Usage
### use script to collect results
Run `script.m` with your choice of algorithms and problems. 

## TODOs

### Algorithms
| Code|Debug |  Algorithm 
|:---:|:----:|:-----|
| [x] | [x] | 1. GradientDescent, with backtracking line search
| [x] | [x] | 2. GradientDescentW, with Wolfe line search
| [x] | [x] | 3. Newton, (modified Newton) with backtracking line search
| [x] | [x] | 4. NewtonW, (modified Newton) with Wolfe line search
| [x] | [x] | 5. TRNewtonCG, trust region Newton with CG subproblem solver
| [x] | [x] | 6. TRSR1CG, SR1 quasi-Newton with CG subproblem solver
| [x] | [x] | 7. BFGS, BFGS quasi-Newton with backtracking line search
| [x] | [x] | 8. BFGSW, BFGS quasi-Newton with Wolfe line search
| [x] | [x] | 9. DFP, DFP quasi-Newton with backtracking line search
| [x] | [x] | 10. DFPW, DFP quasi-Newton with Wolfe line search

### problems
| Code|Debug | problems
|:---:|:----:|:-----|
| [x] | [x] | P1 quad 10 10
| [x] | [x] | P2 quad 10 1000
| [x] | [x] | P3 quad 1000 10
| [x] | [x] | P4 quad 1000 1000
| [x] | [x] | P5 quartic 1
| [x] | [x] | P6 quartic 2 
| [x] | [x] | Rosenbrock 2 
| [x] | [x] | Rosenbrock 100
| [x] | [x] | DataFit 2
| [x] | [x] | Exponential 10
| [x] | [x] | Exponential 1000
| [x] | [x] | Genhumps 5


## git tutorial
### start your project with your branch
```bash
git clone [http repo_address]
cd [foler address]
git branch [your_branch_name]
```

### daily working routine
``` bash
git pull # in canse anyone else do some chages
git status # check current branch status, make sure you are in correct branch
git add . # add all changes to stack
git commit -m “commit messgae” # confirm changes in stack
git push # push local change to online repo
git pull #[next time, if any change]
```

### merge changes from main
```bash
git checkout main
git pull
git checkout [your_branch]
git merge main 
git push
```
