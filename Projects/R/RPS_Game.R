rps_game <- function () {

  cat(" Pao-Ying-Chup! ", "\n") 
  items <- c("rock", "paper", "scissors")
  win_items <- c("scissors", "rock", "paper")
  lose_items <- c("paper", "scissors", "rock")
  point_types <- c("Win", "Lose", "Draw")
  df_winlose <- data.frame(items, win_items, lose_items)
  print(df_winlose)
  points <- c(3,0,1)
  df_point <- data.frame(point_types, points)
  print(df_point)
  lose <- 0
  win <- 0
  round <- 0
  draw <- 0
  point <- 0

  while (TRUE) {
      print("Ready? [y/n]")
      player_ans <- readLines("stdin", n = 1)
      if ( tolower(player_ans) == "y") {
        while (TRUE) {
          cat("Let's select the item in ", items, "\n")
          cat("Quit the game, type exit", "\n")
          bot_select <- sample(items,1)
          player_select <- readLines("stdin", n = 1)
          if ( tolower(player_select) == "exit") {
            cat("Total Round: ", round, "\n")
            cat("Win: ", win, "\n")
            cat("Lose: ", lose, "\n")
            cat("Draw: ", draw, "\n")
            cat("Total Point: ", point, "\n")
            print("Good job!, Thank you to join us, See ya!")
            break
          } else if ( tolower(player_select) == items[1]) {
            if (bot_select == items[1]) {
              round = round + 1
              draw = draw + 1
              point = point + 1
              cat("Your item: ", player_select, "\n")
              cat("Bot item: ", bot_select, "\n")
              cat("Round: ", round, " > Draw", "\n")
            } else if (bot_select == items[2]) {
              round = round + 1
              lose = lose
              point = point + 0
              cat("Your item: ", player_select, "\n")
              cat("Bot item: ", bot_select, "\n")
              cat("Round: ", round, " > Lose", "\n")
            } else {
              round = round + 1
              win = win + 1
              point = point + 3
              cat("Your item: ", player_select, "\n")
              cat("Bot item: ", bot_select, "\n")
              cat("Round: ", round, " > Win", "\n")
            }
          } else if ( tolower(player_select) == items[2]) {
            if (bot_select == items[1]) {
              round = round + 1
              win = win + 1
              point = point + 3
              cat("Your item: ", player_select, "\n")
              cat("Bot item: ", bot_select, "\n")
              cat("Round: ", round, " > Win", "\n")
            } else if (bot_select == items[2]) {
              round = round + 1
              draw = draw + 1
              point = point + 1
              cat("Your item: ", player_select, "\n")
              cat("Bot item: ", bot_select, "\n")
              cat("Round: ", round, " > Draw", "\n")
            } else {
              round = round + 1
              lose = lose
              point = point + 0
              cat("Your item: ", player_select, "\n")
              cat("Bot item: ", bot_select, "\n")
              cat("Round: ", round, " > Lose", "\n")
            }
          } else if ( tolower(player_select) == items[3]) {
            if (bot_select == items[1]) {
              round = round + 1
              lose = lose
              point = point + 0
              cat("Your item: ", player_select, "\n")
              cat("Bot item: ", bot_select, "\n")
              cat("Round: ", round, " > Lose", "\n")
            } else if (bot_select == items[2]) {
              round = round + 1
              win = win + 1
              point = point + 3
              cat("Your item: ", player_select, "\n")
              cat("Bot item: ", bot_select, "\n")
              cat("Round: ", round, " > Win", "\n")
            } else {
              round = round + 1
              draw = draw + 1
              point = point + 1
              cat("Your item: ", player_select, "\n")
              cat("Bot item: ", bot_select, "\n")
              cat("Round: ", round, " > Draw", "\n")
            }
          } else {
            print("Please check about you type item correctly again")
          }
        }
        
      break  
      } else if ( tolower(player_ans) == "n"){
        print("Hope to see you back to play again, Thank you")
        break
      } else {
        print("Please check about your answer [y/n] correctly again")
      }
  }
  
  
}

rps_game()
