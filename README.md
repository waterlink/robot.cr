# robot

Small robot walking around the board.

## Installation

```bash
git clone https://github.com/waterlink/robot.cr
cd robot.cr
make
```

## Usage

```bash
./bin/robot
robot :001 > board 6,6
robot :002 > place 3,2,west
robot :003 > forward
robot :004 > right
robot :005 > forward
robot :006 > report
=> 2,1,north
robot :007 > ^D
=> exit
```

## Commands

### board M,N

Creates a board of size M,N and makes it current active board. Board is indexed: `{ X: 1..M, Y: 1..N }`.

### place X,Y,D

Places the robot at position X,Y on active board facing direction D. D can be:

- `north`,
- `east`,
- `south`,
- `west`.

If direction is invalid, command is ignored.

If position is not on board, command is ignored.

If there is no active board, command is ignored.

### forward

Moves the robot towards the direction it faces by one board cell.

If robot is not placed on board, command is ignored.

If movement would result in robot falling of the board, command is ignored.

### left

Rotates robot counterclockwise.

If robot is not placed on board, command is ignored.

### right

Rotates robot clockwise.

If robot is not placed on board, command is ignored.

### report

Reports current robot position.

If robot is not placed on board, command is ignored.

### exit or CTRL+D or EOF

Exits the application.

## Development

Just use normal TDD cycle.

- `make test` to run all test suites.
- `crystal spec spec/some_file_spec.cr` to run only one test suite.
- `make` to compile the final binary at `./bin/robot`.
- `make clean` to remove crystal cache in `./.crystal` and compiled files in `./bin/`

## Contributing

1. Fork it ( https://github.com/waterlink/robot.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [waterlink](https://github.com/waterlink) Oleksii Fedorov - creator, maintainer
