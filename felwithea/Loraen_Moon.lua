function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and welcome.  I'm Loraen and I like to help new enchanters? I have lots of spare [gear] if you'd like some?");
	elseif(e.message:findi("favor")) then
		e.self:Say("Oh, um, on second thought, never mind.  I should really just do it myself.  Thank you anyway."); 
	end
end

