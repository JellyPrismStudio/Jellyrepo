if live_call() return live_result;

if args.tipo == "usable" and !executado
{
	script_execute(args.effect, args.arg0, args.arg1)

	remove_item(1, oninv)
	instance_destroy();
}