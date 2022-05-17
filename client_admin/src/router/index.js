import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},

	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},
	// 员工用户路由
	{
		path: '/employee_user/table',
		name: 'employee_user_table',
		component: () => import('../views/employee_user/table.vue')
	},
	{
		path: '/employee_user/view',
		name: 'employee_user_view',
		component: () => import('../views/employee_user/view.vue')
	},
	// 部门管理路由
	{
		path: '/department_management/table',
		name: 'department_management_table',
		component: () => import('../views/department_management/table.vue')
	},
	{
		path: '/department_management/view',
		name: 'department_management_view',
		component: () => import('../views/department_management/view.vue')
	},
	// 员工考勤路由
	{
		path: '/employee_attendance/table',
		name: 'employee_attendance_table',
		component: () => import('../views/employee_attendance/table.vue')
	},
	{
		path: '/employee_attendance/view',
		name: 'employee_attendance_view',
		component: () => import('../views/employee_attendance/view.vue')
	},
	// 员工加班路由
	{
		path: '/employee_overtime/table',
		name: 'employee_overtime_table',
		component: () => import('../views/employee_overtime/table.vue')
	},
	{
		path: '/employee_overtime/view',
		name: 'employee_overtime_view',
		component: () => import('../views/employee_overtime/view.vue')
	},
	// 员工工资路由
	{
		path: '/employee_salary/table',
		name: 'employee_salary_table',
		component: () => import('../views/employee_salary/table.vue')
	},
	{
		path: '/employee_salary/view',
		name: 'employee_salary_view',
		component: () => import('../views/employee_salary/view.vue')
	},
	// 疫苗接种路由
	{
		path: '/vaccination/table',
		name: 'vaccination_table',
		component: () => import('../views/vaccination/table.vue')
	},
	{
		path: '/vaccination/view',
		name: 'vaccination_view',
		component: () => import('../views/vaccination/view.vue')
	},
	// 员工请假路由
	{
		path: '/employee_leave/table',
		name: 'employee_leave_table',
		component: () => import('../views/employee_leave/table.vue')
	},
	{
		path: '/employee_leave/view',
		name: 'employee_leave_view',
		component: () => import('../views/employee_leave/view.vue')
	},
	// 通知公告路由
	{
		path: '/notice_announcement/table',
		name: 'notice_announcement_table',
		component: () => import('../views/notice_announcement/table.vue')
	},
	{
		path: '/notice_announcement/view',
		name: 'notice_announcement_view',
		component: () => import('../views/notice_announcement/view.vue')
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "员工管理系统-admin";
	document.title = title;
})

export default router
