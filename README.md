# Tic Tac Toe Project

Welcome to the Tic Tac Toe project! This is a simple implementation of the classic game, designed for both educational purposes and entertainment. Below is a detailed README.md file that outlines the project, its features, installation instructions, usage, and an overview of the code.


## Introduction

Tic Tac Toe is a two-player game where players take turns marking a square on a 3x3 grid. The objective is to be the first to get three of their marks in a row: horizontally, vertically, or diagonally. This project demonstrates a simple implementation of the game with multiple modes.

## Features

- **Main Screen:**
  - Buttons for "Let's play," "How to play," and "Settings."
- **Select Game Screen:** Contains two buttons - "Single Player" and "Two Player."
  - The "Single Player" mode leads to the game screen against AI.
  - The "Two Player" mode leads to the game screen with a friend.
- **Game Page:**
  - Displays which player's turn it is (always X when playing against AI).
  - Shows a timer in the middle when playing against time.
  - Indicates whose turn it is above the game board.
  - Winning combinations are crossed out with a line.
  - In "Two Player" mode, you need to pass the phone to your friend for their turn.
- **Game Result Screen:**
  - Three possible outcomes: win, lose, or draw.
  - The "Back" button returns to the Select Game screen.
  - The "Play Again" button restarts the game in the previously selected mode.
- **Settings Screen:**
  - Allows you to set a time limit for the game and its duration.
  - Customize the appearance of Xs and Os (from available options) using the "Choose" button. Current selection is marked as Picked.
- **How to Play Screen:**
  - Displays the rules of the game.
- **Leaderboard:**
  - The Leaderboard feature tracks player performance in Tic Tac Toe, ranking players based on the fastest game completion times.

## Installation

To get started with the Tic Tac Toe project, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/glbrom/TicTacToe.git
