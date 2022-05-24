import numpy as np

board = [' ',' ',' ',' ',' ',' ',' ',' ',' ',' ']

def draw():
    print(" %c | %c | %c " % (board[1],board[2],board[3]))
    print("___|___|___")
    print(" %c | %c | %c " % (board[4],board[5],board[6]))
    print("___|___|___")
    print(" %c | %c | %c " % (board[7],board[8],board[9]))
    print("   |   |   ")

def is_game_over(self):
    #Horizontal winning condition
    if(board[1] == board[2] and board[2] == board[3] and board[1] != ' '):
        return True
    elif(board[4] == board[5] and board[5] == board[6] and board[4] != ' '):
        return True
    elif(board[7] == board[8] and board[8] == board[9] and board[7] != ' '):
        return True
    #Vertical Winning Condition
    elif(board[1] == board[4] and board[4] == board[7] and board[1] != ' '):
        return True
    elif(board[2] == board[5] and board[5] == board[8] and board[2] != ' '):
        return True
    elif(board[3] == board[6] and board[6] == board[9] and board[3] != ' '):
        return True
    #Diagonal Winning Condition
    elif(board[1] == board[5] and board[5] == board[9] and board[5] != ' '):
        return True
    elif(board[3] == board[5] and board[5] == board[7] and board[5] != ' '):
        return True
    else:
        draw()
        return False

if __name__ == '__main__':
    is_game_over(board)

