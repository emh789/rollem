# Rollem

Dice-roller and nova calculator. Order-of-Operations compliant. Can read predefined rolls from a file. Interactive session or command line.

## Usage

Open an interactive session:

```
$ rollem
```

Give result and return to shell:

```
$ rollem {roll}
```

## Options

Read a yaml file containing named rolls:

```
$ rollem [-n {file.yml} | --names={file.yml} ] [{roll}]
```

## Rolls

Dieroll:

```
Roll: 2d8
```

Nova:

```
Roll: 2d8+d4+2
```

Named:

```
Roll: Jared
```

## Named Rolls

A yaml file may contain name/nova mappings.

### Basic

```
scimitar: 1d6+2
```

may be rolled by name:

```
Roll: scimitar
```

### Nested

```
Jared:
  scimitar: 1d6+2
  quarterstaff: 1d8+2
```

may be rolled by name:

```
Roll: Jared.scimitar
```

### Naming format

- Names must be word characters [A-Za-z_]
- A period `(.)` indicates a nested attribute.

## Order of Operations

After evaluating dieroll results, the result uses standard mathematical order of operations.

```
Roll: 2d8+2*2
```

equals `2d8*4`.

### Parenthetics

Parentheses will subgroup components of the roll.

```
Roll: (2d8+2)*2
```

### Named Rolls

Named rolls act as a parethetized group.

```
Roll: Jared.quarterstaff*2
```

equals `(1d8+2)*2`.


## Disclaimer

This is a pre-release version. It has been tested within a set of easily-predictable use-case parameters. Unpredicted use-cases may cause unpredicted responses. Additional features planned.

There is absolutely NO WARRANTY OR GUARANTEE for this software.
