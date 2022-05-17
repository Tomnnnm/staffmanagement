<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','staff') || $check_field('add','staff') || $check_field('set','staff')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="员工" prop="staff">
						<el-select v-if="user_group === '管理员' || (form['employee_attendance_id'] && $check_field('set','staff')) || (!form['employee_attendance_id'] && $check_field('add','staff'))" id="staff" v-model="form['staff']" :disabled="disabledObj['staff_isDisabled']">
							<el-option v-for="o in list_user_staff" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','staff')" id="staff" v-model="form['staff']" :disabled="true">
							<el-option v-for="o in list_user_staff" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','attendance_month') || $check_field('add','attendance_month') || $check_field('set','attendance_month')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="考勤月份" prop="attendance_month">
					<el-input id="attendance_month" v-model="form['attendance_month']" placeholder="请输入考勤月份"
							  v-if="user_group === '管理员' || (form['employee_attendance_id'] && $check_field('set','attendance_month')) || (!form['employee_attendance_id'] && $check_field('add','attendance_month'))" :disabled="disabledObj['attendance_month_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','attendance_month')">{{form['attendance_month']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','days_due') || $check_field('add','days_due') || $check_field('set','days_due')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="应到天数" prop="days_due">
					<el-input-number id="days_due" v-model.number="form['days_due']"
						v-if="user_group === '管理员' || (form['employee_attendance_id'] && $check_field('set','days_due')) || (!form['employee_attendance_id'] && $check_field('add','days_due'))"></el-input-number>
					<div v-else-if="$check_field('get','days_due')">{{form['days_due']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','actual_arrival_days') || $check_field('add','actual_arrival_days') || $check_field('set','actual_arrival_days')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="实到天数" prop="actual_arrival_days">
					<el-input-number id="actual_arrival_days" v-model.number="form['actual_arrival_days']"
						v-if="user_group === '管理员' || (form['employee_attendance_id'] && $check_field('set','actual_arrival_days')) || (!form['employee_attendance_id'] && $check_field('add','actual_arrival_days'))"></el-input-number>
					<div v-else-if="$check_field('get','actual_arrival_days')">{{form['actual_arrival_days']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','absence_days') || $check_field('add','absence_days') || $check_field('set','absence_days')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="缺勤天数" prop="absence_days">
					<el-input-number id="absence_days" v-model.number="form['absence_days']"
						v-if="user_group === '管理员' || (form['employee_attendance_id'] && $check_field('set','absence_days')) || (!form['employee_attendance_id'] && $check_field('add','absence_days'))"></el-input-number>
					<div v-else-if="$check_field('get','absence_days')">{{form['absence_days']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','attendance') || $check_field('add','attendance') || $check_field('set','attendance')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="出勤率" prop="attendance">
					<el-input id="attendance" v-model="form['attendance']" placeholder="请输入出勤率"
							  v-if="user_group === '管理员' || (form['employee_attendance_id'] && $check_field('set','attendance')) || (!form['employee_attendance_id'] && $check_field('add','attendance'))"  @focus="set_attendance()" :disabled="disabledObj['attendance_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','attendance')">{{form['attendance']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','remarks') || $check_field('add','remarks') || $check_field('set','remarks')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="备注" prop="remarks">
					<el-input type="textarea" id="remarks" v-model="form['remarks']" placeholder="请输入备注"
						v-if="user_group === '管理员' || (form['employee_attendance_id'] && $check_field('set','remarks')) || (!form['employee_attendance_id'] && $check_field('add','remarks'))" :disabled="disabledObj['remarks_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','remarks')">{{form['remarks']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "employee_attendance_id",
				url_add: "~/api/employee_attendance/add?",
				url_set: "~/api/employee_attendance/set?",
				url_get_obj: "~/api/employee_attendance/get_obj?",
				url_upload: "~/api/employee_attendance/upload?",

				query: {
					"employee_attendance_id": 0,
				},

				form: {
					"staff": 0, // 员工
					"attendance_month":'', // 考勤月份
					"days_due":0, // 应到天数
					"actual_arrival_days":0, // 实到天数
					"absence_days":0, // 缺勤天数
					"attendance":'', // 出勤率
					"remarks":'', // 备注
					"employee_attendance_id": 0, // ID

				},
				disabledObj:{
					"staff_isDisabled": false,
					"attendance_month_isDisabled": false,
					"attendance_isDisabled": false,
					"remarks_isDisabled": false,
				},
				// 用户列表
				list_user_staff: [],

			}
		},
		methods: {
			/**
			 * 获取员工用户用户列表
			 */
			async get_list_user_staff() {
                // if(this.user_group !== "管理员" && this.form["staff"] === 0) {
                //     this.form["staff"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=员工用户");
                if(json.result && json.result.list){
                    this.list_user_staff = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
			get_user_staff(id){
				var obj = this.list_user_staff.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			set_attendance(){
				this.form.attendance =this.form.actual_arrival_days / this.form.days_due
			},

			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
				/**
				* 请求列表前
				* @param {Object} param
				*/
				var user_group = this.user.user_group;
				if (user_group !== "管理员") {
					switch (user_group) {
						case "员工":
							if(param["staff"] > 0){
								param["staff"] = this.user.user_id;
							}
							break;
					}
				}
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){

			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/employee_attendance/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_attendance/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_attendance/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_attendance/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_attendance/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
			this.get_list_user_staff();
		}
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
</style>
