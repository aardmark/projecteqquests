local gear = {
	1357,	-- robe of the ishva
	10407,	-- opaline earring
	10107,	-- batskull earring
	14679,	-- platinum fire wedding ring
	14681,	-- electrum star ruby ring
	10361,	-- a gypsy medallion
	4504,	-- crown of king tranix
	2350,	-- incandescent mask
	2458,	-- gatorscale sleeves
	11603,	-- white dragonscale cloak
	2467,	-- giants reminder string
	1401,	-- embroidered black cape
	14618,	-- golden cat eye bracelet
	10360,	-- bracelet of woven grass
	4410,	-- black chitin leggings
	2351,	-- incandescent gloves
	4407,	-- golden efreeti boots
	6329,	-- rod of insidious glamour
	13355,	-- crude stein
	13942,	-- dragoon dirk
	17403,	-- bag of the tinkerers
	17403,
	17403,
	17403,
	17403,
	17403
};

function event_say(e)
	local is_new = (e.other:HasItem(13593) and e.other:HasItem(9997) and e.other:HasItem(9979));
	if e.other:GetClass() ~= Class.ENCHANTER then
		e.self:Say("I do apologize, but I can only help fellow enchanters.");
		return;
	end
	if(e.message:findi("hail")) then
		if is_new then
			e.self:Say("Hail and welcome. I see you're new. I can't believe they are still handing out that stuff to new enchanters. Give me the robe, dagger and lantern and I'll give you some of my old gear.");
		else
			e.self:Say("It's good to see you again. I have some great items you could have but you'll need to do me some favours.");
		end
		e.self:Say("Oh, and if you'd like some [buffs], let me know.");
	elseif(e.message:findi("buffs")) then
		e.self:Say("Of course! There you go, enjoy.");
		e.self:SpellFinished(1693, e.other);
		e.self:SpellFinished(1410, e.other);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 9997, item2 = 9979, item3 = 13593})) then -- Robe and lantern.
		e.self:Say("Thanks! I'll get rid of those for you. Here's some starter gear and a few platimun to get you started.");
		for _, item_id in ipairs(gear) do
			e.other:SummonItem(item_id);
		end
		e.other:GiveCash(0,0,0,5);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
