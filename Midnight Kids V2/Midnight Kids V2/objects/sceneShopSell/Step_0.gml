/// @description Insert description here
if live_call() return live_result;
// You can write your code in this editor
selected = []
selectedprices = []
for(a = 0; a<slots-1; a++)
{
	if a + page*(slots-2) < array_length(itens)	{
		array_push(selected, itens[a + page*(slots-2)])
		array_push(selectedprices, prices[a + page*(slots-2)])
	}
	else break
}