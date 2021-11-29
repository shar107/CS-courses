Aim: To demonstrate a smart street light project using Arduino UNO, LDR & LED/Smart Street light.


Hardware requirements:
 
1.	Arduino UNO Board
2.	Resistors
3.	Jump Wires
4.	LDR (Light-Dependent Resistor)
5.	Bulb
6.	Power supply
7.	NPN Transistor


Software requirements: Autodesk® TinkerCad® circuit simulation software


Algorithm:

1.	Declaration of variables is the first step. Here, the integer variable "ldr"  is assigned with the value of the PIN of the Arduino Board connected to it. Another variable, "ldr_value" is declared which will be storing the input values from the LDR sensor. The variable "light" is initialized with the value 3.

2.	setup( ) function is going to assign the pin modes for the variables declared. The light variable will be the one connected to Bulb. Hence it is assigned as an output. The LDR is the sensor and will take input values and hence it is assigned as Input.

3.	The loop( ) function is going to execute the lines of code repeatedly. First, the "ldr_value" is going to get values from the sensor which is received from the analogRead( ) function.

4.	The "if" and "else" conditions are written to check the value of the input from the LDR sensor. If the value from the input exceeds the value 512, the Bulb remains OFF. If the value exceeds the value of 512, the Light bulb is switched ON.


Code:
int ldr=A5; 
int ldr_value; 
int light=3; 
void setup() 
{ 
pinMode(light, OUTPUT); 
pinMode(ldr, INPUT); 
} 
void loop() 
{ 
ldr_value=analogRead(ldr); 
if (ldr_value>512) 
digitalWrite(light, LOW); 
else digitalWrite(light, HIGH); 
}
