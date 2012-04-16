window.addObject = ->
	b2PolygonShape = Box2D.Collision.Shapes.b2PolygonShape;
	b2CircleShape = Box2D.Collision.Shapes.b2CircleShape;

	if Math.random() > 0.5
		window.fixDef.shape = new b2PolygonShape;
		window.fixDef.shape.SetAsBox Math.random() + 0.1, Math.random() + 0.1
	else
		window.fixDef.shape = new b2CircleShape Math.random() + 0.1

	window.bodyDef.position.x = Math.random() * 10
	window.bodyDef.position.y = Math.random() * 10
	window.world.CreateBody(window.bodyDef).CreateFixture(window.fixDef)

$(->
	$("<canvas>")
		.attr({width: 600, height: 400})
		.attr("id", "stage")
		.appendTo("body");

	init = ->
		b2Vec2 = Box2D.Common.Math.b2Vec2
		b2BodyDef = Box2D.Dynamics.b2BodyDef
		b2Body = Box2D.Dynamics.b2Body
		b2FixtureDef = Box2D.Dynamics.b2FixtureDef
		b2Fixture = Box2D.Dynamics.b2Fixture
		b2World = Box2D.Dynamics.b2World
		b2MassData = Box2D.Collision.Shapes.b2MassData
		b2PolygonShape = Box2D.Collision.Shapes.b2PolygonShape
		b2CircleShape = Box2D.Collision.Shapes.b2CircleShape
		b2DebugDraw = Box2D.Dynamics.b2DebugDraw
		

		world =	new b2World(new b2Vec2(0, 10), true)

		fixDef = new b2FixtureDef
		fixDef.density = 1.0
		fixDef.friction = 0.5
		fixDef.restitution = 0.2

		bodyDef = new b2BodyDef;

		# Create Ground
		bodyDef.type = b2Body.b2_staticBody
		bodyDef.position.x = 9
		bodyDef.position.y = 13
		fixDef.shape = new b2PolygonShape
		fixDef.shape.SetAsBox(10, 0.5)
		world.CreateBody(bodyDef).CreateFixture(fixDef)

		bodyDef.type = b2Body.b2_dynamicBody;

		fixDef.shape = new b2PolygonShape;
		fixDef.shape.SetAsBox(
				.4 #half width
				, .4 #half height
				);
		
		bodyDef.position.x = Math.random() * 10;
		bodyDef.position.y = Math.random() * 10;
		window.player = world.CreateBody(bodyDef).CreateFixture(fixDef);


		# Setup debug draw
		debugDraw = new b2DebugDraw()
		debugDraw.SetSprite(document.getElementById("stage").getContext("2d"))
		debugDraw.SetDrawScale(30.0)
		debugDraw.SetFillAlpha(0.3)
		debugDraw.SetLineThickness(1.0)
		debugDraw.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit)
		world.SetDebugDraw(debugDraw)

		window.world = world
		window.bodyDef = bodyDef
		window.fixDef = fixDef

		window.setInterval window.update, 1000 / 60

	window.update = ->
		world.Step(1 / 60, 10, 10)
		world.DrawDebugData()
		world.ClearForces()

	init()
);
