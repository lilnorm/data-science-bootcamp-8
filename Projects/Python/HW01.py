# import random
import random as rd

# create a game function
def pao_ying_chub():

    while True:

        # title
        print("Pao-Ying-Chub Game!")
        ans = input("Are you ready! (y/n): ")

        # empty variables: win lose draw
        n_win = 0
        n_lose = 0
        n_draw = 0

        # create item selection
        select = ["rock", "scissor", "paper"]

        # playing game condition
        if ans == "y":

            # game start
            while True:

                # input from player
                player = input("Select: rock, scissor, paper: ")
                # bot sample item
                bot = rd.sample(select, 1)[0]

                # game condition
                if player == bot:
                    n_draw += 1
                    print("Bot Select: ", bot)
                    print("-> DRAW\n")

                elif player.lower() == "rock":
                    if bot == "scissor":
                        n_win += 1
                        print("Bot Select: ", bot)
                        print("-> WIN\n")
                    else:
                        n_lose += 1
                        print("Bot Select: ", bot)
                        print("-> LOSE\n")

                elif player.lower() == "scissor":
                    if bot == "paper":
                        n_win += 1
                        print("Bot Select: ", bot)
                        print("-> WIN\n")
                    else:
                        n_lose += 1
                        print("Bot Select: ", bot)
                        print("-> LOSE\n")

                elif player.lower() == "paper":
                    if bot == "rock":
                        n_win += 1
                        print("Bot Select: ", bot)
                        print("-> WIN\n")
                    else:
                        n_lose += 1
                        print("Bot Select: ", bot)
                        print("-> LOSE\n")

                elif player.lower() == "quit":
                    print("Summary:")
                    # print stat of player in this game
                    print(f"Total wins: {n_win}")
                    print(f"Total lose: {n_lose}")
                    print(f"Total draw: {n_draw}")
                    print("\n************Thank you to join us, See you next time!************\n")
                    break

                else:
                    print("Nope! please try again\n")

        elif ans == "n":
            print("""\n
            --------------------------
            | Thanks for joining us  |
            | Hope to see you again! |
            --------------------------
            """)
            break

        else:
            print("Wrong command!  Enter 'y' for yes and 'n' for NO.\n")


pao_ying_chub()
