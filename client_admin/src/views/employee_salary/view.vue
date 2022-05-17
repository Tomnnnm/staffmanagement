<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','staff') || $check_field('add','staff') || $check_field('set','staff')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="员工" prop="staff">
						<el-select v-if="user_group === '管理员' || (form['employee_salary_id'] && $check_field('set','staff')) || (!form['employee_salary_id'] && $check_field('add','staff'))" id="staff" v-model="form['staff']" :disabled="disabledObj['staff_isDisabled']">
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
			<el-col v-if="user_group === '管理员' || $check_field('get','salary_month') || $check_field('add','salary_month') || $check_field('set','salary_month')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="发薪月份" prop="salary_month">
					<el-input id="salary_month" v-model="form['salary_month']" placeholder="请输入发薪月份"
							  v-if="user_group === '管理员' || (form['employee_salary_id'] && $check_field('set','salary_month')) || (!form['employee_salary_id'] && $check_field('add','salary_month'))" :disabled="disabledObj['salary_month_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','salary_month')">{{form['salary_month']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','base_pay') || $check_field('add','base_pay') || $check_field('set','base_pay')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="基本工资" prop="base_pay">
					<el-input-number id="base_pay" v-model.number="form['base_pay']"
						v-if="user_group === '管理员' || (form['employee_salary_id'] && $check_field('set','base_pay')) || (!form['employee_salary_id'] && $check_field('add','base_pay'))"></el-input-number>
					<div v-else-if="$check_field('get','base_pay')">{{form['base_pay']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','overtime_pay') || $check_field('add','overtime_pay') || $check_field('set','overtime_pay')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="加班费" prop="overtime_pay">
					<el-input-number id="overtime_pay" v-model.number="form['overtime_pay']"
						v-if="user_group === '管理员' || (form['employee_salary_id'] && $check_field('set','overtime_pay')) || (!form['employee_salary_id'] && $check_field('add','overtime_pay'))"></el-input-number>
					<div v-else-if="$check_field('get','overtime_pay')">{{form['overtime_pay']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','commission') || $check_field('add','commission') || $check_field('set','commission')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="提成" prop="commission">
					<el-input-number id="commission" v-model.number="form['commission']"
						v-if="user_group === '管理员' || (form['employee_salary_id'] && $check_field('set','commission')) || (!form['employee_salary_id'] && $check_field('add','commission'))"></el-input-number>
					<div v-else-if="$check_field('get','commission')">{{form['commission']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','attendance_deduction') || $check_field('add','attendance_deduction') || $check_field('set','attendance_deduction')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="考勤扣款" prop="attendance_deduction">
					<el-input-number id="attendance_deduction" v-model.number="form['attendance_deduction']"
						v-if="user_group === '管理员' || (form['employee_salary_id'] && $check_field('set','attendance_deduction')) || (!form['employee_salary_id'] && $check_field('add','attendance_deduction'))"></el-input-number>
					<div v-else-if="$check_field('get','attendance_deduction')">{{form['attendance_deduction']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','five_insurances_and_one_fund') || $check_field('add','five_insurances_and_one_fund') || $check_field('set','five_insurances_and_one_fund')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="五险一金" prop="five_insurances_and_one_fund">
					<el-input-number id="five_insurances_and_one_fund" v-model.number="form['five_insurances_and_one_fund']"
						v-if="user_group === '管理员' || (form['employee_salary_id'] && $check_field('set','five_insurances_and_one_fund')) || (!form['employee_salary_id'] && $check_field('add','five_insurances_and_one_fund'))"></el-input-number>
					<div v-else-if="$check_field('get','five_insurances_and_one_fund')">{{form['five_insurances_and_one_fund']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','taxation') || $check_field('add','taxation') || $check_field('set','taxation')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="税费" prop="taxation">
					<el-input-number id="taxation" v-model.number="form['taxation']"
						v-if="user_group === '管理员' || (form['employee_salary_id'] && $check_field('set','taxation')) || (!form['employee_salary_id'] && $check_field('add','taxation'))"></el-input-number>
					<div v-else-if="$check_field('get','taxation')">{{form['taxation']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','net_salary') || $check_field('add','net_salary') || $check_field('set','net_salary')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="实发工资" prop="net_salary">
					<el-input id="net_salary" v-model="form['net_salary']" placeholder="请输入实发工资"
							  v-if="user_group === '管理员' || (form['employee_salary_id'] && $check_field('set','net_salary')) || (!form['employee_salary_id'] && $check_field('add','net_salary'))"  @focus="set_net_salary()" :disabled="disabledObj['net_salary_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','net_salary')">{{form['net_salary']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','remarks') || $check_field('add','remarks') || $check_field('set','remarks')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="备注" prop="remarks">
					<el-input id="remarks" v-model="form['remarks']" placeholder="请输入备注"
							  v-if="user_group === '管理员' || (form['employee_salary_id'] && $check_field('set','remarks')) || (!form['employee_salary_id'] && $check_field('add','remarks'))" :disabled="disabledObj['remarks_isDisabled']"></el-input>
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
				field: "employee_salary_id",
				url_add: "~/api/employee_salary/add?",
				url_set: "~/api/employee_salary/set?",
				url_get_obj: "~/api/employee_salary/get_obj?",
				url_upload: "~/api/employee_salary/upload?",

				query: {
					"employee_salary_id": 0,
				},

				form: {
					"staff": 0, // 员工
					"salary_month":'', // 发薪月份
					"base_pay":0, // 基本工资
					"overtime_pay":0, // 加班费
					"commission":0, // 提成
					"attendance_deduction":0, // 考勤扣款
					"five_insurances_and_one_fund":0, // 五险一金
					"taxation":0, // 税费
					"net_salary":'', // 实发工资
					"remarks":'', // 备注
					"employee_salary_id": 0, // ID

				},
				disabledObj:{
					"staff_isDisabled": false,
					"salary_month_isDisabled": false,
					"net_salary_isDisabled": false,
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
			set_net_salary(){
				this.form.net_salary =this.form.base_pay + this.form.overtime_pay + this.form.commission - this.form.attendance_deduction - this.form.five_insurances_and_one_fund - this.form.taxation
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
					bl = this.$check_action('/employee_salary/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_salary/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_salary/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_salary/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/employee_salary/view','get');
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
