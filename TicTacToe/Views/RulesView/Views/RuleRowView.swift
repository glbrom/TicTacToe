//
//  RuleRowView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

// Определяем словарь с правилами игры, где ключ — это номер правила, а значение — текст правила
let game_rules: [Int: String] = [
    1: "Draw a grid with three rows and three columns, creating nine squares in total.", // Правило 1: Нарисуйте сетку 3x3
    2: "Players take turns placing their marker (X or O) in an empty square. To make a move, a player selects a number corresponding to the square where they want to place their marker.", // Правило 2: Игроки по очереди ставят свои знаки в пустые клетки
    3: "Player X starts by choosing a square (e.g., square 5). Player O follows by choosing an empty square (e.g., square 1). Continue alternating turns until the game ends.", // Правило 3: Игрок X начинает первым и выбирает клетку
    4: "The first player to align three of their markers horizontally, vertically, or diagonally wins. Examples of Winning Combinations: Horizontal: Squares 1, 2, 3 or 4, 5, 6 or 7, 8, 9 Vertical: Squares 1, 4, 7 or 2, 5, 8 or 3, 6, 9 Diagonal: Squares 1, 5, 9 or 3, 5,7." // Правило 4: Победа достигается при выстраивании трех знаков в ряд
]
