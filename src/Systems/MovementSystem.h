#ifndef MOVEMENTSYSTEM_H
#define MOVEMENTSYSTEM_H

class MovementSystem //: public System
{
	MovementSystem()
	{
		// RequireComponent<TransformComponent>();
	}

	void Update()
	{
		/*for (auto entity : GetSystemEntities())
		{
			auto& transform = ECS::GetComponent<TransformComponent>(entity);

			transform.position.x += 1;
			transform.position.y += 1;
		}*/
	}
};

#endif