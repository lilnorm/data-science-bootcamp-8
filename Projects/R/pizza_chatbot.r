chatbot <- function() {
  
  print(" Hi, I'm Pizz, the Pizza ordering assistant ")
  print(" What's your name bro! [type your name below this] ")
  customer_name <- readLines("stdin", n = 1)
  print( paste(" What kind of pizza do you want, ", customer_name) )

  ## menu
  id <- 1:4
  menu <-  c("HAWAIIAN", "DOUBLE CHEESE", "SEAFOOD", "MIGHTY MEAT")
  price <- c(379, 299, 439, 339)
  pizza_menu <- data.frame(id, menu, price)
  print(pizza_menu)
  print(" Type your menu you want  [type menu below this] " )
  choose_menu <- readLines("stdin", n = 1)
  total_price <- 0
  if (choose_menu %in% tolower(pizza_menu$menu) ) {
    print( paste(" Your menu is, ", choose_menu ) )
    while (TRUE) {
      if (choose_menu == tolower(pizza_menu$menu[1]) ) {
        total_price = pizza_menu$price[1]
        print( paste(" Total Price : ", total_price ) )
        break
      } else if (choose_menu == tolower(pizza_menu$menu[2]) ) {
        total_price = pizza_menu$price[2]
        print( paste(" Total Price : ", total_price ) )
        break
      } else if (choose_menu == tolower(pizza_menu$menu[3]) ) {
        total_price = pizza_menu$price[3]
        print( paste(" Total Price : ", total_price ) )
        break
      } else if (choose_menu == tolower(pizza_menu$menu[4]) ) {
        total_price = pizza_menu$price[4]
        print( paste(" Total Price : ", total_price ) )
        break
      } 
    }
  } else {
    print( " We apologize if have no menu you want, Please choose again ")
  }

  ## size
  size_id <- 1:2
  size <- c("M", "L")
  size_price <- c("Normal Price", "+120")
  pizza_size <- data.frame(size_id, size, size_price)
  print(pizza_size)
  print(" Select the size [type size below this] ")
  choose_size <- readLines("stdin", n = 1)
  if (choose_size %in% tolower(pizza_size$size) ) {
    print( paste(" Pizza Size, ", choose_size ) )
    while (TRUE) {
      if (choose_size == tolower(pizza_size$size[1]) ) {
        total_price = total_price
        print( paste(" Total Price : ", total_price ) )
        break
      } else if (choose_size == tolower(pizza_size$size[2]) ) {
        total_price = total_price + 120
        print( paste(" Total Price : ", total_price ) )
        break
      }
    }
  } else {
    print( "Size is not match, Please choose again ")
  }

  ## crust
  crust_id <- 1:3
  crust <- c("Pan", "Thin", "Cheese")
  crust_price <- c("Normar Price", "-40", "+100")
  pizza_crust <- data.frame(crust_id, crust, crust_price)
  print(pizza_crust)
  print(" Select the crust [type crust below this] ")
  choose_crust <- readLines("stdin", n = 1)
  if (choose_crust %in% tolower(pizza_crust$crust) ) {
    print( paste(" Pizza Crust, ", choose_crust ) )
    while (TRUE) {
      if (choose_crust == tolower(pizza_crust$crust[1]) ) {
        total_price = total_price
        print( paste(" Total Price : ", total_price ) )
        break
      } else if (choose_crust == tolower(pizza_crust$crust[2]) ) {
        total_price = total_price - 40
        print( paste(" Total Price : ", total_price ) )
        break
      } else if (choose_crust == tolower(pizza_crust$crust[3]) ) {
        total_price = total_price + 100
        print( paste(" Total Price : ", total_price ) )
        break
      } 
    }
  } else {
    print( " Crust is not match, Please choose again ")
  }

  customer_order <- c("Menu", "Size", "Crust", "Total Price")
  order <- c(choose_menu, choose_size, choose_crust, total_price)
  df_order <- data.frame(customer_order, order)
  print(df_order)
  print(" Summary your order, Is it correct? [y/n] ")
  confirm <- readLines("stdin", n = 1)
  if ( confirm == "y") {
    print(" Thank you bro!, Enjoy your meal and hope to see you again next time")
  } else if ( confirm == "n") {
    print(" Run again to go back to first step ")
  }
  


}

chatbot()
