package body AdaptiveQuad is
	
	function SimpsonRule(A:Float; B: Float) return Float is
		C : Float;
		H3 : Float;
		begin
			C:= (A+B) / 2.0;
			if(A>B) then
				H3:= (A-B) / 6.0;
			else
				H3 := (B-A) / 6.0; 
			 end if;	
			 return H3*(F(A) + 4.0*F(C) + F(B));
		end;
	
	function RecurseASR(A:Float; B: Float; EPS: Float; Value: Float) return Float is
        C: Float;
		left: Float;
		right: Float;
		Sum: Float:= 0.0;
		Diff: Float;
		LEFTSUM: Float;
		RIGHTSUM: Float;
		procedure Concurrency(A:Float;B:Float; C:Float; EPS:Float; left:Float; right:Float) is
			task RecurseLeft;
			task RecurseRight;
			task body RecurseLeft is
			begin
				LEFTSUM := RecurseASR(A,C,EPS,left);
			end RecurseLeft;
			task body RecurseRight is
			begin
				RIGHTSUM := RecurseASR(C,B,EPS,left);
			end RecurseRight;
		begin
			null;
		end Concurrency;
		begin
			C := (A+B)/2.0;
			left := SimpsonRule(A,C);
			right := SimpsonRule(C,B);
			Sum := left + right;
			if(Sum > Value) then
				Diff := Sum - Value;
			else
				Diff := Value - Sum;
			end if; 
			if ( Diff < EPS*15.0 ) then
				return (left + right + ((left + right - Value)/15.0));
			else
				Concurrency(A,B,C,EPS/2.0,left,right);
				return LEFTSUM + RIGHTSUM;
			end if;
		end;
		
	function AQuad(A:Float; B:Float; EPS: Float) return Float is 
		Value: Float;
		begin	
			Value := SimpsonRule(A,B);
			return RecurseASR(A,B,EPS,Value);	
		end;

end AdaptiveQuad;
