//
//  RulesView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

//  RulesView.swift
//  TicTac-Toe
//
//  Created by Vladimir Dmitriev on 29.09.24.
//

import SwiftUI

// Определяем структуру RulesView, которая соответствует протоколу View
struct RulesView: View {
    var body: some View {
        // Основной контейнер для вертикального расположения элементов
        VStack {
            // Горизонтальный стек для кнопки и заголовка
            HStack {
                // Кнопка для возврата на предыдущий экран
                Button(action: {
                    // Действие, которое произойдет при нажатии на кнопку
                    // Здесь можно добавить код для возврата на предыдущий экран
                }) {
                    Image(systemName: "arrow.left") // Иконка стрелки влево
                        .font(.title) // Устанавливаем размер шрифта
                        .font(.system(size: 16, weight: .regular)) // Устанавливаем вес шрифта
                        .padding(.horizontal, 20) // Добавляем горизонтальные отступы
                        .foregroundStyle(.black) // Устанавливаем цвет иконки
                }
                
                // Заголовок "How to play"
                Text("How to play")
                    .font(.title2) // Устанавливаем размер шрифта заголовка
                    .fontWeight(.bold) // Устанавливаем жирный стиль шрифта
                    .padding(.horizontal, 50) // Добавляем горизонтальные отступы
                    .padding(.vertical, 35) // Добавляем вертикальные отступы
                Spacer() // Заполняем оставшееся пространство справа
            }
            
            // Прокручиваемый контейнер для правил игры
            ScrollView {
                // Перебираем ключи словаря game_rules, сортируя их по возрастанию
                ForEach(game_rules.keys.sorted(), id: \.self) { rules_number in
                    
                    HStack {
                        // Иконка с номером правила в круге
                        Image(systemName: "\(rules_number).circle.fill")
                            .font(.system(size: 45)) // Устанавливаем размер шрифта иконки
                            .font(.system(size: 16, weight: .thin)) // Устанавливаем тонкий стиль шрифта
                            .padding(10) // Добавляем отступы вокруг иконки
                            .foregroundStyle(.black, Color(red: 213/255, green: 193/255, blue: 246/255).opacity(0.8))
                            // Внутри черный, снаружи фиолетовый с прозрачностью

                        // Текст правила, получаемый из словаря game_rules по номеру правила
                        Text("\(game_rules[rules_number] ?? "Rule not found")")
                            .padding() // Добавляем отступы вокруг текста
                            .font(.body) // Устанавливаем размер шрифта текста правила
                            //.background(.blue.opacity(0.1)) // (Закомментировано) Фон для текста (можно использовать)
                            .background(Color(red: 230/255, green: 233/255, blue: 249/255).opacity(0.8))
                            // Фон с заданным цветом и прозрачностью
                            //.padding(20) // (Закомментировано) Дополнительные отступы вокруг текста (можно использовать)
                            .clipShape(.rect(cornerRadius: 30))
                            // Закругляем углы фона текста

                        Spacer() // Заполняем оставшееся пространство справа
                        Spacer() // Дополнительное пространство (можно удалить для оптимизации)
                    }
                }
            }
            
            Spacer() // Заполняем оставшееся пространство снизу
            
        }
    }
}

// Предварительный просмотр представления RulesView в Xcode Canvas или SwiftUI Preview
#Preview {
    RulesView()
}
