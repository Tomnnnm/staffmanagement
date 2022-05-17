<template>
	<el-main class="bg">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','department_number') || $check_field('add','department_number') || $check_field('set','department_number')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="部门编号" prop="department_number">
					<el-input id="department_number" v-model="form['department_number']" placeholder="请输入部门编号"
							  v-if="user_group === '管理员' || (form['department_management_id'] && $check_field('set','department_number')) || (!form['department_management_id'] && $check_field('add','department_number'))" :disabled="disabledObj['department_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','department_number')">{{form['department_number']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','department') || $check_field('add','department') || $check_field('set','department')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="部门" prop="department">
					<el-input id="department" v-model="form['department']" placeholder="请输入部门"
							  v-if="user_group === '管理员' || (form['department_management_id'] && $check_field('set','department')) || (!form['department_management_id'] && $check_field('add','department'))" :disabled="disabledObj['department_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','department')">{{form['department']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','person_in_charge') || $check_field('add','person_in_charge') || $check_field('set','person_in_charge')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="负责人" prop="person_in_charge">
					<el-input id="person_in_charge" v-model="form['person_in_charge']" placeholder="请输入负责人"
							  v-if="user_group === '管理员' || (form['department_management_id'] && $check_field('set','person_in_charge')) || (!form['department_management_id'] && $check_field('add','person_in_charge'))" :disabled="disabledObj['person_in_charge_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','person_in_charge')">{{form['person_in_charge']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','number_of_departments') || $check_field('add','number_of_departments') || $check_field('set','number_of_departments')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="部门人数" prop="number_of_departments">
					<el-input-number id="number_of_departments" v-model.number="form['number_of_departments']"
						v-if="user_group === '管理员' || (form['department_management_id'] && $check_field('set','number_of_departments')) || (!form['department_management_id'] && $check_field('add','number_of_departments'))"></el-input-number>
					<div v-else-if="$check_field('get','number_of_departments')">{{form['number_of_departments']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','date_of_incorporation') || $check_field('add','date_of_incorporation') || $check_field('set','date_of_incorporation')" :xs="24" :sm="12" :lg="8">
				<el-form-item label="成立日期" prop="date_of_incorporation">
					<el-date-picker :disabled="disabledObj['date_of_incorporation_isDisabled']" v-if="user_group === '管理员' || (form['department_management_id'] && $check_field('set','date_of_incorporation')) || (!form['department_management_id'] && $check_field('add','date_of_incorporation'))" id="date_of_incorporation"
						v-model="form['date_of_incorporation']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','date_of_incorporation')">{{form['date_of_incorporation']}}</div>
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
				field: "department_management_id",
				url_add: "~/api/department_management/add?",
				url_set: "~/api/department_management/set?",
				url_get_obj: "~/api/department_management/get_obj?",
				url_upload: "~/api/department_management/upload?",

				query: {
					"department_management_id": 0,
				},

				form: {
					"department_number":'', // 部门编号
					"department":'', // 部门
					"person_in_charge":'', // 负责人
					"number_of_departments":0, // 部门人数
					"date_of_incorporation":'', // 成立日期
					"department_management_id": 0, // ID

				},
				disabledObj:{
					"department_number_isDisabled": false,
					"department_isDisabled": false,
					"person_in_charge_isDisabled": false,
					"date_of_incorporation_isDisabled": false,
				},

			}
		},
		methods: {

			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
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
        if (this.form["date_of_incorporation"].indexOf("-")===-1){
          this.form["date_of_incorporation"] = this.$toTime(parseInt(this.form["date_of_incorporation"]),"yyyy-MM-dd")
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
				if(parseInt(this.form["date_of_incorporation"]) > 9999){
					this.form["date_of_incorporation"] = this.$toTime(parseInt(this.form["date_of_incorporation"]),"yyyy-MM-dd")
				}

			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/department_management/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/department_management/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/department_management/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/department_management/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/department_management/view','get');
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
