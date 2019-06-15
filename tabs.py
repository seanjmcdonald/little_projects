'''

                            Online Python Interpreter.
                Code, Compile, Run and Debug python program online.
Write your code in this editor and press "Run" button to execute it.

'''

class Chord():
    def __init__(self):
        self.location=location
        self.value=value

class Music:
    
    G = ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-',]
    C = ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-',]
    E = ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-',]
    A = ['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-',]
    saveLocation=''
    titleSong='default name'
    flag=False

    def placeNote(self,chord,location,value):
        if chord.upper()=='G':
            self.G[int(location)]=value
        if chord.upper()=='C':
            self.C[int(location)]=value
        if chord.upper()=='E':
            self.E[int(location)]=value
        if chord.upper()=='A':
            self.A[int(location)]=value
          

    def getNote(self):
        while True:
            print(self)
            chord = input("what chord would you like to change? or hit q to quit ")
            if chord.upper()=='Q':
                return
            location = input("where location would you like to change? ")
            value = input("what value would you like to place? ")
        ##confirm
            self.placeNote(str(chord),location,value)

    def load(self):
        file_to_load=input("what file would you like to load? ")
        opened_file=open(file_to_load,"r")
        self.titleSong=opened_file.readline()
        self.G=opened_file.readline()
        self.C=opened_file.readline()
        self.E=opened_file.readline()
        self.A=opened_file.readline()
        opened_file.close()
        self.flag=True
        
    def saveNotes(self):
        if self.saveLocation == '':
            self.saveLocation = input('what would you like to save your file as? ')
        confirmSave = input('\nare you sure you want to save it as ' + self.saveLocation + ' hit Y to confirm\n')
        if confirmSave.upper() == 'Y':
            file = open(self.saveLocation,'w+')
            file.write(str(self).replace('G ','').replace('C ','').replace('E ','').replace('A ',''))
            file.close()

    def changeName(self):
        name=input('what would you like to name this song? ')
        self.titleSong=str(name)

    def __str__(self):
        for i in range(len(self.G)):
            print(' '+str(i),end =' ')
        print()
        if self.flag==False:
            return self.titleSong+'\n'+'G '+' '.join(self.G) +'\n' + 'C '+ ' '.join(self.C) + '\n' +'E '+' '.join(self.E) + '\n'+'A '+' '.join(self.A)+ '\n'
        else:
            return self.titleSong+'G '+''.join(self.G) + 'C '+ ''.join(self.C) +'E '+''.join(self.E) +'A '+''.join(self.A)

    
    
    
mymusic=Music()
user_input=1
while user_input!='0':
    user_input=input("1 = change a note.\n2 = show notes\n3 = save\n4 = change song name\n0 = quit\n")
    if user_input=='1':
        mymusic.getNote()
        print(mymusic)
    if user_input=='2':
        print(mymusic)
    if user_input=='3':
        mymusic.saveNotes()
    if user_input=='4':
        mymusic.changeName()
    if user_input=='5':
        mymusic.load()
    if user_input=='0':
        quit()

#mymusic.getNote()
#print(mymusic)
