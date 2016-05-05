#ifndef __MENU_H__
#define __MENU_H__

#define MENU_TYPE_BAUD	1
#define MENU_TYPE_LIST	2

struct MENU {
	const char*	entry;
	int		type;
	int*		value;
	void*		data;
};

void menu_do(struct MENU* menu);

#endif /* __MENU_H__ */
