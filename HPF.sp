*************************************************************************************
*******************************High Pass Filter First Order**************************
*************************************************************************************
***** Porush, Vivek                               e-mail: vporus2@uic.edu************
*****                        vivek.91.porush@gmail.com                        *******
***High Pass Filter First Order                                                   ***
***    Copyright (C) <2014>  <Porush Vivek>                                        ***
***    This program is free software: you can redistribute it and/or modify        ***
***    it under the terms of the GNU Affero General Public License as published by ***
***    the Free Software Foundation, either version 3 of the License, or           ***
***    (at your option) any later version.                                         ***
***                                                                                ***
***    This program is distributed in the hope that it will be useful,             ***
***    but WITHOUT ANY WARRANTY; without even the implied warranty of              ***
***    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the               ***
***    GNU Affero General Public License for more details.                         ***
***                                                                                ***
***    You should have received a copy of the GNU Affero General Public License    ***
***    along with this program.  If not, see <http://www.gnu.org/licenses/>.       ***
***                                                                                ***
*My contact information can be found on <https://sites.google.com/site/vivekporush91/>*
*************************************************************************************
*************This Project is listed under Analog & Mixed Signal VLSI*****************
*************************************************************************************
***Circuit parameters are given as :-->                                           ***
***                                                                               ***
***-->1. Vs	=  0.5 V AC                   \\ Input Voltage \\ \\ Passive \\       ***
***-->2. Vregulated = +/- 12 V Dc         \\DC Regulated Voltage\\ \\Passive\\    ***
***-->3. Fcutoff =	28.1 Khz              \\ Cut off Frequency \\ \\ Passive\\    ***
*************************************************************************************
*************************************************************************************
***Output results :-->                                                            ***
***Obtain requested cutoff frequency and verify results.                          ***
*************************************************************************************
*************************************SPICE-Code**************************************
.INCLUDE LM741.sp
** Voltage Source AC (Vs= 0.5V)
VS 1 0 AC 0.5V
** Input & Feed-Back resistor & capacitor network
R1 4 5 500
R2 5 6 2.5k
C1 1 4 0.01u
** OP-AMP Bias Circuit nets (V+/V-)
V+ 2 0 12V
V- 3 0 -12V
** OP-Amp Sub Circuit Call
X1 0 5 2 3 6 LM741
** Set output conditions for simulation analysis
.OP
** Set Analysis required (AC LIN (NP) or DEC (ND)) with FSTART & FSTOP
.AC LIN 10 1000 10e3
** Set print variables (These variables will be stored in the output log)
.PRINT V(6)
** Terminate all sequences and end simulation
.END
