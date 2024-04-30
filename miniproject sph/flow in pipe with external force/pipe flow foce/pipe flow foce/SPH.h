#pragma once
#include <iostream>
#include <cmath>

#define PI 4.f*atan(1.f)
class SPH
{
	public:

	//quartic kernel (Liu and Liu, 2010)
	float Kernel(float r, float h) {
		float q, kernel, alpha;
		alpha = 7.f / (478.f * PI* pow(h,2));
		kernel = 0;
		q = r / h;
		if (q > 0&& q < 2) {
			kernel = alpha*(2.f/3.f - 9.f* pow(q,2) /8.f + 19.f* pow(q, 3) /24.f - 5.f* pow(q, 4)/32.f);
		}
		else {
			kernel = 0;
		}
		return kernel;
	}


	float gradKernel(float r, float h) {
		float q, kernel, alpha;
		alpha = 7.f / (478.f * PI * pow(h, 2));
		kernel = 0;
		q = r / h;
		if (q > 0 && q < 2) {
			kernel = alpha * ( - 9.f * pow(q, 2) / 4.f + 19.f * pow(q, 2) / 8.f - 5.f * pow(q, 3) / 8.f);
		}
		else {
			kernel = 0;
		}
		return kernel;
	}

	/*
	float calculateDensity() {

	}
	*/

	/*
	float calculateAcceleration() {

	}
	*/

	/*
	float calculateVelocity() {

	}
	*/

	/*
	float checkCollision(particle i, particle j) {

	}
	*/
};

