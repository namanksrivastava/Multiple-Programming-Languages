with Text_Io;
use Text_Io;

with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

with AdaptiveQuad;

with Ada.Numerics.Generic_Elementary_Functions;

procedure AQMain is
	package FloatFunctions is new Ada.Numerics.Generic_Elementary_Functions(Float);
	use FloatFunctions;
	Epsilon: constant := 0.000001;
	
	function Myf(X:Float) return Float is
	Y: Float;
  	begin
			Y:= X * X;
     		return Sin(Y);
  	end Myf;

	package SinAdaptiveQuad is new AdaptiveQuad(Myf);
	
	task ComputeArea is
		entry ComputeAssign (value1: Float; value2: Float);
	end ComputeArea;
	
	task PrintResult is
		entry PrintAssign (lowerBound:Float; upperBound:Float; Result:Float);
	end PrintResult;
	
	task ReadPairs;
	task body ReadPairs is
		value1: Float;
		value2: Float;
		begin
		for I in 1..5 loop
			Get (value1);
			Get (value2);
			ComputeArea.ComputeAssign(value1,value2);
		end loop;
		end ReadPairs;
	
		task body ComputeArea is
		lowerBound : Float;
		upperBound : Float;
		Result : Float;
		begin
		for I in 1..5 loop
			accept ComputeAssign(value1: Float; value2: Float) do
					lowerBound := value1;
					upperBound := value2;
			end ComputeAssign;
			Result := SinAdaptiveQuad.AQuad(lowerBound,upperBound,Epsilon);
			PrintResult.PrintAssign(lowerBound,upperBound,Result);
		end loop;
		end ComputeArea;
	
		task body PrintResult is
		A: Float;
		B: Float;
		C: Float;
		begin
		for I in 1..5 loop
			accept PrintAssign(lowerBound:Float;upperBound:Float;Result:Float) do
					A := lowerBound;
					B := upperBound;
					C := Result;
			end PrintAssign;
			Put ("The area under sin(x^2) for x = ");
			Put (A);
			Put (" to ");
			Put (B);
			Put (" is ");
			Put (C);
			New_Line; 
		end loop;
		end PrintResult;
begin
	null;
end AQMain;